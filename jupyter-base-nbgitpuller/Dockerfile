FROM gcr.io/savvy-kit-260206/aron-backend-kernel:jupyter-base

USER root

RUN apt-get update && apt-get install -y git

USER $NB_UID

RUN python -m pip install nbgitpuller
