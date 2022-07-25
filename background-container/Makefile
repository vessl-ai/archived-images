docker_build:
	docker build --platform=linux/amd64 -t quay.io/vessl-ai/kernels-toolbox:$(tag) .

docker_push: docker_build
	docker push quay.io/vessl-ai/kernels-toolbox:$(tag)

docker_build_no_cache:
	docker build --platform=linux/amd64 --no-cache -t quay.io/vessl-ai/kernels-toolbox:$(tag) .

docker_push_no_cache: docker_build_no_cache
	docker push quay.io/vessl-ai/kernels-toolbox:$(tag)
