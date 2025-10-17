# To remove <none> images: docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
# Run "docker build --no-cache -t <tag_name> ." to build image

FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG ROS2_DISTRO=humble

# Install ROS1 and libraries
RUN apt update && apt install -y \
    # Basic Ubuntu libraries
    sudo wget git rsync nano curl htop lsb-release gnupg2 apt-utils libssh-dev graphviz tzdata gnupg iputils-ping \
    cmake build-essential pkg-config ffmpeg x264 libx264-dev python3-pip openjdk-17-jdk && \
    # Python 3 libraries
    # python3 -m pip install --upgrade pip && \
    # apt-get install -y python3-matplotlib python3-sklearn python3-sklearn-lib python3-pandas && \
    # CUDA Toolkit (use keyring)
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb && \
    dpkg -i cuda-keyring_1.1-1_all.deb && \
    # curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-cuda-keyring.gpg && \
    # echo "deb [signed-by=/usr/share/keyrings/nvidia-cuda-keyring.gpg] https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /" | sudo tee /etc/apt/sources.list.d/cuda-repository.list && \
    apt update && apt install -y cuda-toolkit-12-3 && \
    # apt install libcudnn8=8.9.7.29-1+cuda12.3 libcudnn8-dev=8.9.7.29-1+cuda12.3 libcudnn8-samples=8.9.7.29-1+cuda12.3 && \
    rm -rf /var/lib/apt/lists/*
