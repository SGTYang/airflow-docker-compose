# airflow-classification-model
    https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html

# Setting the right Airflow user
```
mkdir -p ./dags ./logs ./plugins
echo -e "AIRFLOW_UID=$(id -u)" > .env
```
