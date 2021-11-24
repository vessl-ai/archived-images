# images

VESSL images for experiment and workspace

## Image Description
### Data science packages (DS)
All **VESSL Images** have the most used data science python package installed. The full list of **DS** packages are as follows.    
```bash
numpy, scipy, pandas, matplotlib, scikit-learn, opencv-python, seaborn, plotly, tqdm
```

### Image tag
All images are based on Ubuntu 18.04. 
- `py3x` tags indicate python version **3.x**
- `-cuda1X.x` tags are based on Nvidia CUDA version **1X.x**. You need `nvidia-docker` to run them.
- `full-cpu` or `full-gpu` tags have three compatible machine learning frameworks installed. (*PyTorch*, *TensorFlow*, *MXNet*)
- `jupyter`  tags include JupyterLab and some extensions. They start a Jupyter notebook server on boot.

## VESSL Image
### Commands
```bash
# Use deploy script
python deploy.py --dockerhub {DOCKERHUB_REPO} -t {TAG} {DIR} --push

make push-base       # Build base images and push them to public.ecr.aws/vessl/kernels 
make push-experiment # Build experiment images and push them to public.ecr.aws/vessl/kernels
make push-workspace  # Build workspace images and push them to public.ecr.aws/vessl/kernels
make push-all        # Build all images and push them to public.ecr.aws/vessl/kernels
```

### Base
| Python | CUDA | DS | Image Tag                                    |
|--------|------|----|---------------------------------------------|
| 3.6    | x    | ✅ | `public.ecr.aws/vessl/kernels:py36`          |
| 3.6    | 10.2 | ✅ | `public.ecr.aws/vessl/kernels:py36-cuda10.2` | 
| 3.6    | 11.2 | ✅ | `public.ecr.aws/vessl/kernels:py36-cuda11.2` |
| 3.7    | x    | ✅ | `public.ecr.aws/vessl/kernels:py37`          |
| 3.7    | 10.2 | ✅ | `public.ecr.aws/vessl/kernels:py37-cuda10.2` |
| 3.7    | 11.2 | ✅ | `public.ecr.aws/vessl/kernels:py37-cuda11.2` |


### Experiment
| Python | CUDA | PyTorch     | TensorFlow | MXNet | DS | Image Tag                                             |
|--------|------|-------------|------------|-------|----|-------------------------------------------------------|
| 3.6    | x    | 1.6.0       | 2.5.2      | 1.6.0 | ✅ | `public.ecr.aws/vessl/kernels:py36.full-cpu`          |
| 3.6    | 10.2 | 1.6.0       | 2.5.2      | 1.6.0 | ✅ | `public.ecr.aws/vessl/kernels:py36-cuda10.2.full-gpu` | 
| 3.6    | 11.2 | 1.8.1+cu111 | 2.5.2      | 1.6.0 | ✅ | `public.ecr.aws/vessl/kernels:py36-cuda11.2.full-gpu` |
| 3.7    | x    | 1.6.0       | 2.5.2      | 1.6.0 | ✅ | `public.ecr.aws/vessl/kernels:py37.full-cpu`          |
| 3.7    | 10.2 | 1.6.0       | 2.5.2      | 1.6.0 | ✅ | `public.ecr.aws/vessl/kernels:py37-cuda10.2.full-gpu` |
| 3.7    | 11.2 | 1.7.0+cu110 | 2.5.2      | 1.6.0 | ✅ | `public.ecr.aws/vessl/kernels:py37-cuda11.2.full-gpu` |

### Workspace (Jupyter)
| Python | CUDA | PyTorch     | TensorFlow | MXNet | Jupyter | DS | Image Tag                                                    |
|--------|------|-------------|------------|-------|---------|----|---------------------------------------------------------------|
| 3.6    | x    | 1.6.0       | 2.5.2      | 1.6.0 | ✅      | ✅ | `public.ecr.aws/vessl/kernels:py36.full-cpu.jupyter`          |
| 3.6    | 10.2 | 1.6.0       | 2.5.2      | 1.6.0 | ✅      | ✅ | `public.ecr.aws/vessl/kernels:py36-cuda10.2.full-gpu.jupyter` |
| 3.6    | 11.2 | 1.7.0+cu110 | 2.5.2      | 1.6.0 | ✅      | ✅ | `public.ecr.aws/vessl/kernels:py36-cuda11.2.full-gpu.jupyter` |
| 3.7    | x    | 1.6.0       | 2.5.2      | 1.6.0 | ✅      | ✅ | `public.ecr.aws/vessl/kernels:py37.full-cpu.jupyter`          |
| 3.7    | 10.2 | 1.6.0       | 2.5.2      | 1.6.0 | ✅      | ✅ | `public.ecr.aws/vessl/kernels:py37-cuda10.2.full-gpu.jupyter` |
| 3.7    | 11.2 | 1.7.0+cu110 | 2.5.2      | 1.6.0 | ✅      | ✅ | `public.ecr.aws/vessl/kernels:py37-cuda11.2.full-gpu.jupyter` |
 

## Public Image 
### PyTorch
| Python | CUDA | PyTorch | Image Tag                                     |
|--------|------|---------|-----------------------------------------------|
| 3.7    | 10.1 | 1.6.0   | `pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel` |
| 3.8    | 11.0 | 1.7.0   | `pytorch/pytorch:1.7.0-cuda11.0-cudnn8-devel` |
| 3.8    | 11.1 | 1.8.0   | `pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel` |

### Tensorflow
| Python | CUDA | TensorFlow | Image Tag                              |
|--------|------|------------|----------------------------------------|
| 3.6    | x    | 1.14.0     | `tensorflow/tensorflow:1.14.0-py3`     |
| 3.6    | 10.0 | 1.14.0     | `tensorflow/tensorflow:1.14.0-gpu-py3` |
| 3.6    | x    | 1.15.5     | `tensorflow/tensorflow:1.15.5-py3`     |
| 3.6    | 10.0 | 1.15.5     | `tensorflow/tensorflow:1.15.5-gpu-py3` |
| 3.6    | x    | 2.0.4      | `tensorflow/tensorflow:2.0.4-py3`      |
| 3.6    | 10.0 | 2.0.4      | `tensorflow/tensorflow:2.0.4-gpu-py3`  |
| 3.6    | x    | 2.2.1      | `tensorflow/tensorflow:2.2.1-py3`      |
| 3.6    | 10.1 | 2.2.1      | `tensorflow/tensorflow:2.2.1-gpu-py3`  |
| 3.6    | x    | 2.3.2      | `tensorflow/tensorflow:2.3.2`          |
| 3.6    | 10.1 | 2.3.2      | `tensorflow/tensorflow:2.3.2-gpu`      |
| 3.6    | x    | 2.4.1      | `tensorflow/tensorflow:2.4.1`          |
| 3.6    | 11.0 | 2.4.1      | `tensorflow/tensorflow:2.4.1-gpu`      |
