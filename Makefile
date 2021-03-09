run_image:
	docker run -td savvihub/kernels:$(tag)

run_jupyter:
	docker run -td -p 8888:8888 savvihub/kernels:$(tag)

push-base: push-base-py36 push-base-py37

push-base-py36:
	python deploy.py --dockerhub savvihub/kerenels -t py36 base --push
	python deploy.py --dockerhub savvihub/kerenels -t py36-cuda10.1 base --push
	python deploy.py --dockerhub savvihub/kerenels -t py36-cuda11.0 base --push

push-base-py37:
	python deploy.py --dockerhub savvihub/kerenels -t py37 base --push
	python deploy.py --dockerhub savvihub/kerenels -t py37-cuda10.1 base --push
	python deploy.py --dockerhub savvihub/kerenels -t py37-cuda11.0 base --push

push-experiment: push-experiment-py36 push-experiment-py37

push-experiment-py36:
	python deploy.py --dockerhub savvihub/kerenels -t py36.full-cpu experiment --push
	python deploy.py --dockerhub savvihub/kerenels -t py36-cuda10.1.full-gpu experiment --push
	python deploy.py --dockerhub savvihub/kerenels -t py36-cuda11.0.full-gpu experiment --push

push-experiment-py37:
	python deploy.py --dockerhub savvihub/kerenels -t py37.full-cpu experiment --push
	python deploy.py --dockerhub savvihub/kerenels -t py37-cuda10.1.full-gpu experiment --push
	python deploy.py --dockerhub savvihub/kerenels -t py37-cuda11.0.full-gpu experiment --push

push-service: push-service-py36 push-service-py37

push-service-py36:
	python deploy.py --dockerhub savvihub/kerenels -t py36.full-cpu.jupyter service --push
	python deploy.py --dockerhub savvihub/kerenels -t py36-cuda10.1.full-gpu.jupyter service --push
	python deploy.py --dockerhub savvihub/kerenels -t py36-cuda11.0.full-gpu.jupyter service --push

push-service-py37:
	python deploy.py --dockerhub savvihub/kerenels -t py37.full-cpu.jupyter service --push
	python deploy.py --dockerhub savvihub/kerenels -t py37-cuda10.1.full-gpu.jupyter service --push
	python deploy.py --dockerhub savvihub/kerenels -t py37-cuda11.0.full-gpu.jupyter service --push

push-all: push-base push-experiment push-service