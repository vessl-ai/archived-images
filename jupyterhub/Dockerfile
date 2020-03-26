FROM jupyterhub/k8s-hub:0.8.2

USER root

RUN pip3 uninstall -y jupyterhub-kubespawner
RUN pip3 install git+https://github.com/savvi-ai/kubespawner@7596d63503a74013919656f77574a9c8a5a7627d
RUN pip3 install git+https://github.com/savvi-ai/jwtauthenticator_v2@7fbafc9eff3c36e5a0cb3cde413e0ce29dfe5e99

USER jovyan
