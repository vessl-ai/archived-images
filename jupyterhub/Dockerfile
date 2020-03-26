FROM jupyterhub/k8s-hub:0.8.2

USER root

RUN pip3 uninstall -y jupyterhub-kubespawner
RUN pip3 install git+https://github.com/savvi-ai/kubespawner@custom
RUN pip3 install git+https://github.com/savvi-ai/jwtauthenticator_v2@6b70d47aab9a8318475ac2c45a68763efb5e33f1

USER jovyan
