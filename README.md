# airflow-docker-compose

1. Set "Volumes" before running (volumes for dags, logs, so on and so forth)
2. Before initiating airflow make sure proper User UID in .env file(.env is only for docker compose)

## Setting Volumes
Important! Make sure you have a correct permission on /var/run/docker.sock file

``` yaml
volumes:
    - /data/airflow/dags:/opt/airflow/dags
    - /data/airflow//logs:/opt/airflow/logs
    - /data/airflow//plugins:/opt/airflow/plugins
    - /data:/data
    - /var/run/docker.sock:/var/run/docker.sock
```

## Setting the right Airflow user
On Linux, the quick-start needs to know your host user id and needs to have group id set to 0. 
Otherwise the files created in dags, logs and plugins will be created with root user ownership. 
You have to make sure to configure them for the docker-compose


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
