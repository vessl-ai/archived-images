docker_build:
	docker build -t public.ecr.aws/vessl/kernels-toolbox:$(tag) .

docker_push: docker_build
	docker push public.ecr.aws/vessl/kernels-toolbox:$(tag)

docker_build_no_cache:
	docker build --no-cache -t public.ecr.aws/vessl/kernels-toolbox:$(tag) .

docker_push_no_cache: docker_build_no_cache
	docker push public.ecr.aws/vessl/kernels-toolbox:$(tag)
