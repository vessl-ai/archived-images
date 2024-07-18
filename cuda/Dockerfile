FROM --platform=linux/amd64 nvcr.io/nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04 AS cuda-12.1
ARG PY_VERSION=3.10

ENV DEBIAN_FRONTEND=noninteractive
ENTRYPOINT ["/bin/bash"]
CMD []

# Install Python
RUN apt-get update && \
    apt-get install -yq \
        # Install basic dependencies here
        openssh-server curl software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get install -yq python${PY_VERSION} python${PY_VERSION}-venv binutils binfmt-support && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Install Pip
RUN curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py --no-cache-dir --no-compile && \
    rm get-pip.py

# Install VESSL SDK/CLI
RUN pip3 install --no-cache-dir --no-compile --disable-pip-version-check \
        vessl

# Install Jupyter
RUN pip3 install --no-cache-dir --no-compile --disable-pip-version-check \
    jupyterlab jupyterlab-git ipywidgets

FROM cuda-12.1 AS torch-2.2
# Install Torch 2.2
RUN pip3 install --no-cache-dir --no-compile --disable-pip-version-check \
        "torch~=2.2.2" torchvision torchaudio

FROM cuda-12.1 AS torch-2.3
# Install Torch 2.3
RUN pip3 install --no-cache-dir --no-compile --disable-pip-version-check \
        "torch~=2.3.1" torchvision torchaudio