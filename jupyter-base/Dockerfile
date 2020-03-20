FROM jupyter/base-notebook:hub-1.1.0

USER root

COPY jupyter_notebook_config.py /etc/jupyter/
RUN fix-permissions /etc/jupyter/

USER $NB_UID

RUN jupyter labextension install @jupyterlab/toc
RUN jupyter labextension install @lckr/jupyterlab_variableinspector
RUN python -m pip install jupyterlab-git
RUN jupyter lab build
