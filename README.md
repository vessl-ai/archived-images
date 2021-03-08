# aron-backend-kernels

SavviHub kernel images for experiment and service

## SavviHub Image
### Command
```bash
python deploy.py --dir {DIRECTORY} --tag {TAG} --push
```

### Base
| Python | CUDA | DS | Image Tag                        |
|--------|------|----|----------------------------------|
| 3.6    | x    | ✅ | `savvihub/kernels:py36`          |
| 3.6    | 10.1 | ✅ | `savvihub/kernels:py36-cuda10.1` | 
| 3.6    | 11.0 | ✅ | `savvihub/kernels:py36-cuda11.0` |
| 3.7    | x    | ✅ | `savvihub/kernels:py37`          |
| 3.7    | 10.1 | ✅ | `savvihub/kernels:py37-cuda10.1` |
| 3.7    | 11.0 | ✅ | `savvihub/kernels:py37-cuda11.0` |
#### Data science packages (DS)
```bash
numpy, scipy, pandas, matplotlib, scikit-learn, opencv-python, seaborn, plotly, tqdm
```

### Experiment
| Python | CUDA | PyTorch     | TensorFlow | MXNet | DS | Image Tag                                 |
|--------|------|-------------|------------|-------|----|-------------------------------------------|
| 3.6    | x    | 1.6.0       | 2.2.0      | 1.6.0 | ✅ | `savvihub/kernels:py36.full-cpu`          |
| 3.6    | 10.1 | 1.6.0+cu101 | 2.2.0      | 1.6.0 | ✅ | `savvihub/kernels:py36-cuda10.1.full-cpu` | 
| 3.6    | 11.0 | 1.7.0+cu110 | 2.4.1      | 1.6.0 | ✅ | `savvihub/kernels:py36-cuda11.0.full-cpu` |
| 3.7    | x    | 1.6.0       | 2.2.0      | 1.6.0 | ✅ | `savvihub/kernels:py37.full-gpu`          |
| 3.7    | 10.1 | 1.6.0+cu101 | 2.2.0      | 1.6.0 | ✅ | `savvihub/kernels:py37-cuda10.1.full-gpu` |
| 3.7    | 11.0 | 1.7.0+cu110 | 2.4.1      | 1.6.0 | ✅ | `savvihub/kernels:py37-cuda11.0.full-gpu` |

### Service (Jupyter)
| Python | CUDA | PyTorch     | TensorFlow | MXNet | Jupyter | DS | Image Tag                                        |
|--------|------|-------------|------------|-------|---------|----|--------------------------------------------------|
| 3.6    | x    | 1.6.0       | 2.1.0      | 1.6.0 | ✅      | ✅ | `savvihub/kernels:py36.full-cpu.jupyter`          |
| 3.6    | 10.1 | 1.6.0+cu101 | 2.1.0      | 1.6.0 | ✅      | ✅ | `savvihub/kernels:py36-cuda10.1.full-cpu.jupyter` |
| 3.6    | 11.0 | 1.7.0+cu110 | 2.4.1      | 1.6.0 | ✅      | ✅ | `savvihub/kernels:py36-cuda11.0.full-cpu.jupyter` |
| 3.7    | x    | 1.6.0       | 2.2.0      | 1.6.0 | ✅      | ✅ | `savvihub/kernels:py37.full-gpu.jupyter`          |
| 3.7    | 10.1 | 1.6.0+cu101 | 2.2.0      | 1.6.0 | ✅      | ✅ | `savvihub/kernels:py37-cuda10.1.full-gpu.jupyter` |
| 3.7    | 11.0 | 1.7.0+cu110 | 2.4.1      | 1.6.0 | ✅      | ✅ | `savvihub/kernels:py37-cuda11.0.full-gpu.jupyter` |

#### Disclaimer
`jupyter_tensorboard` , jupyterlab extension, is not installed in CUDA 11.0 related images because `tensorflow` conflict error occurs due to [this issue](https://github.com/chaoleili/jupyterlab_tensorboard/issues/25).  
```bash
Dependency conflict:
jupyter_tensorboard requires tensorflow<2.2.0
CUDA 11.0           requires tensorflow>=2.4.0
```
 
 

## Public Image 
### PyTorch
| Python | CUDA | PyTorch | Image Tag                                        |
|--------|------|---------|--------------------------------------------------|
| | 10.1 | 1.6.0 | `pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel` |
| | 11.0 | 1.7.0 | `pytorch/pytorch:1.7.0-cuda11.0-cudnn8-devel` |
| | 11.1 | 1.8.0 | `pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel` |

### Tensorflow
| Python | CUDA | TensorFlow | Image Tag                                        |
|--------|------|------------|--------------------------------------------------|
| | x    | 1.14.0 | `tensorflow/tensorflow:1.14.0-py3`    |
| | 10.0 | 1.14.0 | `tensorflow/tensorflow:1.14.0-gpu-py3`|
| | x    | 1.15.5 | `tensorflow/tensorflow:1.15.5-py3`    |
| | 10.0 | 1.15.5 | `tensorflow/tensorflow:1.15.5-gpu-py3`|
| | x    | 2.0.4  | `tensorflow/tensorflow:2.0.4-py3`     |
| | 10.0 | 2.0.4  | `tensorflow/tensorflow:2.0.4-gpu-py3` |
| | x    | 2.2.1  | `tensorflow/tensorflow:2.2.1-py3`     |
| | 10.1 | 2.2.1  | `tensorflow/tensorflow:2.2.1-gpu-py3` |
| | x    | 2.3.2 | `tensorflow/tensorflow:2.3.2-py3`      |
| | 10.1 | 2.3.2 | `tensorflow/tensorflow:2.3.2-gpu-py3`  |
| | x    | 2.4.1 | `tensorflow/tensorflow:2.4.1-py3`      |
| | 11.0 | 2.4.1 | `tensorflow/tensorflow:2.4.1-gpu-py3`  |
