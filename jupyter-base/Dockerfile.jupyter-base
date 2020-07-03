FROM jupyter/base-notebook:latest

COPY jupyter_notebook_config.py /etc/jupyter/
COPY start-notebook.sh /usr/local/bin/

USER root
RUN fix-permissions /etc/jupyter/

USER $NB_UID

# RUN jupyter labextension install @jupyterlab/toc
# RUN jupyter labextension install @lckr/jupyterlab_variableinspector
# RUN python -m pip install jupyterlab-git
# RUN jupyter lab build

CMD ["start-notebook.sh"]
