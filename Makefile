run_image:
    docker run -td savvihub/kernels:$(tag)

run_jupyter:
    docker run -td -p 8888:8888 savvihub/kernels:$(tag)

push-base: push-base-py36 push-base-py37

push-base-py36:
    python deploy.py --dockerhub savvihub/kernels -t py36 base --push
    python deploy.py --dockerhub savvihub/kernels -t py36-cuda10.1 base --push
    python deploy.py --dockerhub savvihub/kernels -t py36-cuda11.0 base --push

push-base-py37:
    python deploy.py --dockerhub savvihub/kernels -t py37 base --push
    python deploy.py --dockerhub savvihub/kernels -t py37-cuda10.1 base --push
    python deploy.py --dockerhub savvihub/kernels -t py37-cuda11.0 base --push

push-experiment: push-experiment-py36 push-experiment-py37

push-experiment-py36:
    python deploy.py --dockerhub savvihub/kernels -t py36.full-cpu experiment --push
    python deploy.py --dockerhub savvihub/kernels -t py36-cuda10.1.full-gpu experiment --push
    python deploy.py --dockerhub savvihub/kernels -t py36-cuda11.0.full-gpu experiment --push

push-experiment-py37:
    python deploy.py --dockerhub savvihub/kernels -t py37.full-cpu experiment --push
    python deploy.py --dockerhub savvihub/kernels -t py37-cuda10.1.full-gpu experiment --push
    python deploy.py --dockerhub savvihub/kernels -t py37-cuda11.0.full-gpu experiment --push

push-workspace: push-workspace-py36 push-workspace-py37

push-workspace-py36:
    python deploy.py --dockerhub savvihub/kernels -t py36.full-cpu.jupyter workspace --push
    python deploy.py --dockerhub savvihub/kernels -t py36-cuda10.1.full-gpu.jupyter workspace --push
    python deploy.py --dockerhub savvihub/kernels -t py36-cuda11.0.full-gpu.jupyter workspace --push

push-workspace-py37:
    python deploy.py --dockerhub savvihub/kernels -t py37.full-cpu.jupyter workspace --push
    python deploy.py --dockerhub savvihub/kernels -t py37-cuda10.1.full-gpu.jupyter workspace --push
    python deploy.py --dockerhub savvihub/kernels -t py37-cuda11.0.full-gpu.jupyter workspace --push

push-all: push-base push-experiment push-workspace
