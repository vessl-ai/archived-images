docker_push: docker_build
	docker push gcr.io/savvy-kit-260206/jupyterhub:$(tag)

docker_build:
	docker build -t gcr.io/savvy-kit-260206/jupyterhub:$(tag) .
