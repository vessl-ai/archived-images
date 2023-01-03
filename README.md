# images

VESSL images for experiment and workspace

## Image Description
### Data science packages (DS)
All **VESSL Images** have the most used data science python package installed. The full list of **DS** packages are as follows.    
```bash
numpy, scipy, pandas, matplotlib, scikit-learn, opencv-python, seaborn, plotly, tqdm
```

### Image tag 
- `py3x` tags indicate python version **3.x**
- `full-cpu` or `full-gpu` tags have three compatible machine learning frameworks installed. (*PyTorch*, *TensorFlow*, *MXNet*)
- `tf1`, `tf2` tags indicate tensorflow version based on NGC
- `torch` tags indicate torch version based on NGC

## VESSL Image
### Commands
```bash
WIP
```

### CPU - Base
| Python | CUDA | Image Tag                                    |
|--------|------|----|---------------------------------------------|
| 3.6    | x    | `python:3.6.14-slim-buster`          |
| 3.7    | x    | `python:3.7.11-slim-buster`          |
| 3.8    | x    | `python:3.8.16-slim-buster`          |
| 3.9    | x    | `python:3.9.16-slim-buster`          |
| 3.10    | x    | `python:3.10.4-slim-buster`          |


### CPU - Workload
| Python | CUDA | DS | Image Tag                                    |
|--------|------|----|---------------------------------------------|
| 3.6    | x    | ✅ | `quay.io/vessl-ai/kernels:py36`          |
| 3.7    | x    | ✅ | `quay.io/vessl-ai/kernels:py37`          |
| 3.8    | x    | ✅ | `quay.io/vessl-ai/kernels:py38`          |
| 3.9    | x    | ✅ | `quay.io/vessl-ai/kernels:py39`          |
| 3.10    | x    | ✅ | `quay.io/vessl-ai/kernels:py310`          |


### NGC - Workload

VESSL-supported GPU images are based on NVIDIA's NGC Image. You may want to check this site(link) to investigate what's inside.


* [torch](https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/index.html)
* [tensorflow](https://docs.nvidia.com/deeplearning/frameworks/tensorflow-release-notes/index.html)