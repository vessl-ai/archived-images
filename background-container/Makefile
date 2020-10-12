docker_build:
	docker build -t savvihub/background-container:$(tag) .

docker_push: docker_build
	docker push savvihub/background-container:$(tag)
