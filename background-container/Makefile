docker_build:
    docker build -t savvihub/background-container:$(tag) .

docker_push: docker_build
    docker push savvihub/background-container:$(tag)

docker_build_no_cache:
    docker build --no-cache -t savvihub/background-container:$(tag) .

docker_push_no_cache: docker_build_no_cache
    docker push savvihub/background-container:$(tag)
