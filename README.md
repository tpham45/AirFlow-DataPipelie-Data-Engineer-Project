# Airflow Data Pipeline - Data Engineer Project

## Introduction
This project focuses on creating and automating data pipelines with Airflow as the orchestrator, GCP for data storage, dbt for data transformation, and Soda for data quality checks. It utilizes the Yellow Taxi Data from NYC GOV, adhering to the same ERD diagram for dataset creation in GCP Cloud Storage. The core objective is to demonstrate the setup of a data pipeline, a critical responsibility for data engineers.

## Architecture Framework

![Architecture Framework](https://github.com/tpham45/AirFlow-DataPipelie-Data-Engineer-Project/blob/main/readme%20files/Framework.png)

## ERD Diagram

![ERD Diagram](https://github.com/tpham45/AirFlow-DataPipelie-Data-Engineer-Project/blob/main/readme%20files/ERD%20Diagram.png)


## Technology Stack
- **Python**: Main programming language for scripting Airflow DAGs.
- **Docker**: Utilized for packaging and running Airflow in isolated environments.
- **Airflow**: Orchestration tool for scheduling and monitoring workflows.
- **GCP Cloud**:
  - **BigQuery**: Analytical data warehouse for large-scale data querying.
  - **Cloud Storage**: Blob storage for raw data uploads and intermediate storage.
- **Soda**: Tool for data quality checks and monitoring.
- **dbt (data build tool)**: Transformation tool that enables data modeling and creates datasets for analytics.

## Key Dependencies
- `apache-airflow-providers-google`: Integration of Airflow with GCP.
- `soda-core-bigquery`: Soda integration for data quality checks in BigQuery.
- `astronomer-cosmos[dbt-bigquery]`: Astronomer utility for dbt and BigQuery integration.
- `protobuf`: Serialization library for structured data.

## Requirements
- Install Docker and Airflow: [Setup Guide](#)
- Create a Soda account: [Soda.io](#)
- Install Astronomer CLI: [Installation Guide](#)
- Set up GCP Cloud: [GCP Console](#)

## Project Workflow

### Step 1: Data Ingestion
Raw data is placed in the `"dataset"` directory, ready for ingestion into the data pipeline.

### Step 2: Initialize Pipeline with Airflow
Set up the Airflow DAG in the `"dags"` directory with the `"taxi_data.py"` script to start processing the workflow.

### Step 3: Data Modeling with dbt
Configure dbt project settings in the `"dbt"` directory, including `"dbt_project.yml"`, `"packages.yml"`, and `"profiles.yml"`.

### Step 4: Data Transformation
Perform data transformations using SQL models located in the `"models"` directory, under subdirectories like `"report"`, `"sources"`, and `"transform"`.

### Step 5: Data Reporting
Generate reports using SQL models in the `"report"` subdirectory within `"models"`.

### Step 6: Quality Assurance with Soda
Run data quality checks defined in the `"soda"` directory to ensure data integrity and accuracy.

### Step 7: Data Deployment
The transformed and validated data is output in the `"target"` directory within `"dbt"`, ready for use in reporting and analytics.

### Step 8: CI/CD
Use the `"tests/dags"` directory for testing Airflow DAGs, and the `"Dockerfile"` and `"requirements.txt"` for deployment configurations.
