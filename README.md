# aron-backend-kernels

SavviHub kernel images in PyTorch/Tensorflow/MXNet

## Command
```bash
python deploy.py --dir {DIRECTORY} --tag {TAG} --push
```

## Base
| PL & OS         | Image Tag                              | Version      | 
|-----------------|----------------------------------------|--------------|
| Python & Ubuntu | `aron-backend-kernel/py36-ubuntu18.04` | 3.6 & 18.04  |
```bash
python deploy.py --dir python --tag py36-ubuntu18.04 --push
```

## PyTorch
| Framework | Image Tag                          | Version | 
|-----------|------------------------------------|---------|
| PyTorch   | `aron-backend-kernel/torch0.4-cpu` | 0.4     |


## Tensorflow
| Framework    | Image Tag                        | Version | 
|--------------|----------------------------------|---------|
| Tensorflow   | `aron-backend-kernel/tf1.14-cpu` | 1.14    |

## MXNet
| Framework    | Image Tag                            | Version | 
|--------------|--------------------------------------|---------|
| MXNet        | `aron-backend-kernel/mxnet1.6.0-cpu` | 1.6.0   |