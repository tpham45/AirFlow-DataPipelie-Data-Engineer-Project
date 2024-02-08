FROM quay.io/astronomer/astro-runtime:10.3.0

RUN python -m venv soda_venv && source soda_venv/bin/activate && \
    pip install --no-cache-dir soda-core-bigquery==3.1.5 &&\
    pip install --no-cache-dir soda-core-scientific==3.1.5 && deactivate

RUN python -m venv dbt_venv && source dbt_venv/bin/activate &&\
    pip install --no-cache-dir dbt-bigquery==1.7.4 &&deactivate