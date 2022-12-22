FROM apache/airflow:2.5.0-python3.10
USER root
RUN apt-get update \
  && apt-get -y install libgl1-mesa-glx libgl1 libglib2.0-0 libsm6 libxext6 g++ swig patchelf\
  && apt-get install -y --no-install-recommends \
         vim \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt