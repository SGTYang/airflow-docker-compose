# airflow-compose
    https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html
    https://jybaek.tistory.com/922

# Setting the right Airflow user
여기서 생성하는 디렉토리는 container의 볼륨으로 마운트 됨
마운트가 되면 container에서 동작하는 airflow task의 로그를 호스트 머신에서 생성한 logs디렉토리에서 확인하거나,
DAG를 container에 넣기 위해 cp할 필요 없이 그냥 dags 디렉토리에 위치 시켜주면 된다

On Linux, the quick-start needs to know your host user id and needs to have group id set to 0. 
Otherwise the files created in dags, logs and plugins will be created with root user ownership. 
You have to make sure to configure them for the docker-compose

```
mkdir -p ./dags ./logs ./plugins
echo -e "AIRFLOW_UID=$(id -u)" > .env
```
