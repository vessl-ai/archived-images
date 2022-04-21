init:
	aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/vessl

run_image:
	docker run -td public.ecr.aws/vessl/kernels:$(tag)

run_jupyter:
	docker run -td -p 8888:8888 public.ecr.aws/vessl/kernels:$(tag)

push-base: init push-base-py36 push-base-py37

push-base-py36:
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py36 base --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py36-cuda10.2 base --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py36-cuda11.2 base --push

push-base-py37:
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py37 base --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py37-cuda10.2 base --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py37-cuda11.2 base --push

push-base-py310:
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py310 base --push

push-experiment: init push-experiment-py36 push-experiment-py37

push-experiment-py36:
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py36.full-cpu experiment --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py36-cuda10.2.full-gpu experiment --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py36-cuda11.2.full-gpu experiment --push

push-experiment-py37:
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py37.full-cpu experiment --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py37-cuda10.2.full-gpu experiment --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py37-cuda11.2.full-gpu experiment --push

push-workspace: init push-workspace-py36 push-workspace-py37

push-workspace-py36:
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py36.full-cpu.jupyter workspace --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py36-cuda10.2.full-gpu.jupyter workspace --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py36-cuda11.2.full-gpu.jupyter workspace --push

push-workspace-py37:
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py37.full-cpu.jupyter workspace --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py37-cuda10.2.full-gpu.jupyter workspace --push
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py37-cuda11.2.full-gpu.jupyter workspace --push

push-workspace-py310:
	python deploy.py --dockerhub public.ecr.aws/vessl/kernels -t py310.full-cpu.jupyter workspace --push

push-all: init push-base push-experiment push-workspace
