# airflow-compose
    https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html
    https://jybaek.tistory.com/922

# Setting list
1. Volumes
2. User UID
3. dags, logs and plugins folder directories
4. Environment values in .env file(.env is only for docker compose)

# Setting Volumes

Important! correct permission on /var/run/docker.sock due to running containers

``` yaml
volumes:
    - /data/airflow/dags:/opt/airflow/dags
    - /data/airflow//logs:/opt/airflow/logs
    - /data/airflow//plugins:/opt/airflow/plugins
    - /data:/data
    - /var/run/docker.sock:/var/run/docker.sock
```

# Setting directories
To make directories
``` bash
mkdir -p ./dags ./logs ./plugins
```

# Setting the right Airflow user
On Linux, the quick-start needs to know your host user id and needs to have group id set to 0. 
Otherwise the files created in dags, logs and plugins will be created with root user ownership. 
You have to make sure to configure them for the docker-compose

``` bash
echo -e "AIRFLOW_UID=$(id -u)" > .env
```

# PostgreSQL Volume Setting 
``` yaml
volumes:
      - postgres-airflow-db-volume:/var/lib/postgresql/data
```

``` yaml
volumes:
  postgres-airflow-db-volume:
    driver: local
    driver_opts:
      type: "none"
      o: "bind"
      device: "/data/postgresql-airflow"
```