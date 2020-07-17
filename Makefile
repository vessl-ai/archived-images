run:
	docker run -td -p 8888:8888 gcr.io/savvy-kit-260206/aron-backend-kernel:$(tag)

push-cpu:
	python deploy.py --dir base --tag py36-ubuntu18.04 --push
	python deploy.py --dir pytorch --tag torch0.4-cpu --push
	python deploy.py --dir pytorch --tag torch1.5-cpu --push
	python deploy.py --dir tensorflow --tag tf1.14-cpu --push
	python deploy.py --dir mxnet --tag 1.6.0-cpu --push
	python deploy.py --dir full --tag full-cpu --push

push-cuda9.2:
	python deploy.py --dir base --tag py36-cuda9.2 --push
	python deploy.py --dir pytorch --tag torch0.4-gpu --push

push-cuda10.0:
	python deploy.py --dir base --tag py36-cuda10.0--push
	python deploy.py --dir tensorflow --tag tf1.14-gpu --push

push-cuda10.1:
	python deploy.py --dir base --tag py36-cuda10.1 --push
	python deploy.py --dir pytorch --tag torch1.5-gpu --push
	python deploy.py --dir tensorflow --tag tf2.2-gpu --push
	python deploy.py --dir mxnet --tag 1.6.0-gpu --push
	python deploy.py --dir full --tag full-gpu --push

push-base:
	python deploy.py --dir base --tag py36-ubuntu18.04 --push
	python deploy.py --dir base --tag py36-cuda9.2 --push
	python deploy.py --dir base --tag py36-cuda10.0 --push
	python deploy.py --dir base --tag py36-cuda10.1 --push

push-torch:
	python deploy.py --dir pytorch --tag torch0.4-cpu --push
	python deploy.py --dir pytorch --tag torch0.4-gpu --push
	python deploy.py --dir pytorch --tag torch1.5-cpu --push
	python deploy.py --dir pytorch --tag torch1.5-gpu --push

push-tf:
	python deploy.py --dir tensorflow --tag tf1.14-cpu --push
	python deploy.py --dir tensorflow --tag tf1.14-gpu --push
	python deploy.py --dir tensorflow --tag tf2.2-cpu --push
	python deploy.py --dir tensorflow --tag tf2.2-gpu --push

push-mxnet:
	python deploy.py --dir mxnet --tag mxnet1.6.0-cpu --push
	python deploy.py --dir mxnet --tag mxnet1.6.0-gpu --push

push-full:
	python deploy.py --dir full --tag full-cpu --push
	python deploy.py --dir full --tag full-gpu --push

push-all: push-base push-torch push-tf push-mxnet push-full