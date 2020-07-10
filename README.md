# aron-backend-kernels

SavviHub kernel images in PyTorch/Tensorflow/MXNet

## Command
```bash
python deploy.py --dir {DIRECTORY} --tag {TAG} --push
```

## Base
| Framework                | Image Tag                              | Version              | 
|--------------------------|----------------------------------------|----------------------|
| Python & Ubuntu          | `aron-backend-kernel/py36-ubuntu18.04` | 3.6 & 18.04          |
| Python & Ubuntu & CUDA   | `aron-backend-kernel/py36-cuda9.2`     | 3.6 & 18.04 & 9.2    |
| Python & Ubuntu & CUDA   | `aron-backend-kernel/py36-cuda10.0`    | 3.6 & 18.04 & 10.0   |
| Python & Ubuntu & CUDA   | `aron-backend-kernel/py36-cuda10.1`    | 3.6 & 18.04 & 10.1   |

## PyTorch
| Framework       | Image Tag                          | Version      | 
|-----------------|------------------------------------|--------------|
| PyTorch         | `aron-backend-kernel/torch0.4-cpu` | 0.4.1        |
| PyTorch & CUDA  | `aron-backend-kernel/torch0.4-gpu` | 0.4.1 & 9.2  |
| PyTorch         | `aron-backend-kernel/torch1.5-cpu` | 1.5.1        |
| PyTorch & CUDA  | `aron-backend-kernel/torch1.5-gpu` | 1.5.1 & 10.1 |

## Tensorflow
| Framework          | Image Tag                        | Version      | 
|--------------------|----------------------------------|--------------|
| Tensorflow         | `aron-backend-kernel/tf1.14-cpu` | 1.14         |
| Tensorflow & CUDA  | `aron-backend-kernel/tf1.14-gpu` | 1.14 & 10.0  |
| Tensorflow         | `aron-backend-kernel/tf2.2-cpu`  | 2.2          |
| Tensorflow & CUDA  | `aron-backend-kernel/tf2.2-gpu`  | 2.2 & 10.1   |

## MXNet
| Framework    | Image Tag                            | Version       | 
|--------------|--------------------------------------|---------------|
| MXNet        | `aron-backend-kernel/mxnet1.6.0-cpu` | 1.6.0         |
| MXNet & CUDA | `aron-backend-kernel/mxnet1.6.0-gpu` | 1.6.0 & 10.1  |

## Full
| Framework                         | Image Tag                      | Version                   | 
|-----------------------------------|--------------------------------|---------------------------|
| PyTorch, Tensorflow, MXNet        | `aron-backend-kernel/full-cpu` | 1.5.1, 2.2, 1.6.0         |
| PyTorch, Tensorflow, MXNet & CUDA | `aron-backend-kernel/full-gpu` | 1.5.1, 2.2, 1.6.0 & 10.1  |