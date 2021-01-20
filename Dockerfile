FROM python:3.7.4-slim-buster

WORKDIR app

RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    build-essential \
    curl \
    wget \
    gpg

# git
RUN apt install git-all -y

# pipeline sdk
RUN pip install kfp --upgrade

# kf fairing
RUN pip install kubeflow-fairing

# Kubeflow config
# jupyter
RUN pip install jupyterlab

ENV NB_PREFIX /

CMD ["sh","-c", "jupyter notebook --notebook-dir=/app --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=${NB_PREFIX}"]