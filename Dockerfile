FROM apache/airflow:2.5.0-python3.10
USER root
RUN apt-get update \
  && apt-get -y install libgl1-mesa-glx libgl1 \
  && apt-get install -y --no-install-recommends \
         vim \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow
RUN pip install --no-cache-dri
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt