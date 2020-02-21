FROM jupyterhub/k8s-hub:0.8.2

USER root

RUN pip3 uninstall -y jupyterhub-kubespawner
RUN pip3 install git+https://github.com/savvi-ai/kubespawner@custom
RUN pip3 install jupyterhub-jwtauthenticator

USER jovyan
