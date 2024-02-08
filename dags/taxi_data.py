from datetime import datetime
from airflow.decorators import dag, task
from airflow.providers.google.cloud.transfers.local_to_gcs import LocalFilesystemToGCSOperator
from airflow.providers.google.cloud.operators.bigquery import BigQueryCreateEmptyDatasetOperator
from airflow.models.baseoperator import chain
# Assuming these imports are part of your project's modules
from astro import sql as aql
from astro.files import File
from astro.sql.table import Table, Metadata
from astro.constants import FileType

# Make sure these imports are correctly structured and located in your project
from include.dbt.cosmos_config import DBT_PROJECT_CONFIG, DBT_CONFIG
from cosmos.airflow.task_group import DbtTaskGroup
from cosmos.constants import LoadMode
from cosmos.config import RenderConfig

@dag(
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False,
    tags=['taxi_data']
)
def taxi_data_dag():
    upload_parquet_to_gcs = LocalFilesystemToGCSOperator(
        task_id='upload_parquet_to_gcs',
        src='/usr/local/airflow/include/dataset/yellow_tripdata_2023-11.parquet',
        dst='raw/yellow_tripdata_2023-11.parquet',
        bucket='taxi-data-project-bucket',
        gcp_conn_id='gcp',
        mime_type='application/octet-stream'
    )
    
    create_taxi_dataset = BigQueryCreateEmptyDatasetOperator(
        task_id='create_taxi_dataset',
        dataset_id='taxi_data',
        gcp_conn_id='gcp',
    )

    data_to_BigQuery = aql.load_file(
        task_id='data_to_BigQuery',
        input_file=File(
            'gs://taxi-data-project-bucket/raw/yellow_tripdata_2023-11.parquet',
            conn_id='gcp',
            filetype=FileType.PARQUET,
        ),
        output_table=Table(
            name='taxi_metadata',
            conn_id='gcp',
            metadata=Metadata(schema='taxi_data')
        ),
        use_native_support=True,
    )

    @task.external_python(python='/usr/local/airflow/soda_venv/bin/python')
    def check_load(scan_name='check_load', checks_subpath='sources'):
        from include.soda.check_function import check
        return check(scan_name, checks_subpath)


    transform = DbtTaskGroup(
        group_id='transform',
        project_config=DBT_PROJECT_CONFIG,
        profile_config=DBT_CONFIG,
        render_config=RenderConfig(
            load_method=LoadMode.DBT_LS,
            select=['path:models/transform']
        )
    )

    @task.external_python(python='/usr/local/airflow/soda_venv/bin/python')
    def check_transform(scan_name='check_transform', checks_subpath='transform'):
        from include.soda.check_function import check
        return check(scan_name, checks_subpath)


    report = DbtTaskGroup(
        group_id='report',
        project_config=DBT_PROJECT_CONFIG,
        profile_config=DBT_CONFIG,
        render_config=RenderConfig(
            load_method=LoadMode.DBT_LS,
            select=['path:models/report']
        )
    )

    @task.external_python(python='/usr/local/airflow/soda_venv/bin/python')
    def check_report(scan_name='check_report', checks_subpath='report'):
        from include.soda.check_function import check
        return check(scan_name, checks_subpath)


    chain(
        upload_parquet_to_gcs,
        create_taxi_dataset,
        data_to_BigQuery,
        check_load(),
        transform,
        check_transform(),
        report,
        check_report()

    )
# Instantiate the DAG
taxi_data_pipeline = taxi_data_dag()
