# To remove <none> images: docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
# Run "docker build --no-cache -t <tag_name> ." to build image

FROM tsender/tensorflow:gpu-focal

ARG DEBIAN_FRONTEND=noninteractive
ARG ROS2_DISTRO=foxy

# ROS2 install
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC && \
    apt update && apt upgrade -y && apt install -y curl gnupg2 lsb-release && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - && \
    sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    # ROS2 install
    apt-get update && sudo apt install -y \
    ros-${ROS2_DISTRO}-desktop \
    ros-${ROS2_DISTRO}-launch* \
    build-essential \
    cmake \
    git \
    rsync \
    python3-colcon-common-extensions \
    python3-pip \
    python3-rosdep \
    python3-vcstool \
    wget \
    iputils-ping \
    htop \
    nano \
    vim && \
    # Install some pip packages needed for testing
    python3 -m pip install -U \
    argcomplete \
    flake8 \
    flake8-blind-except \
    flake8-builtins \
    flake8-class-newline \
    flake8-comprehensions \
    flake8-deprecated \
    flake8-docstrings \
    flake8-import-order \
    flake8-quotes \
    pytest-repeat \
    pytest-rerunfailures \
    pytest \
    pytest-cov \
    pytest-runner \
    setuptools \
    # Adiditional python packages
    transforms3d \
    pymongo \
    tornado \
    paramiko \
    pyopenssl \
    torch==1.12.1 \
    torchvision && \ 
    # Install Fast-RTPS dependencies
    apt-get install --no-install-recommends -y \
    libasio-dev \
    libtinyxml2-dev && \
    # Install Cyclone DDS dependencies
    apt install --no-install-recommends -y \
    libcunit1-dev \
    # Install ffmpeg and related libraries
    ffmpeg x264 libx264-dev && \
    # Rosdep
    rosdep init && rosdep update && \
    rm -rf /var/lib/apt/lists/*

RUN apt update && apt install -y pkg-config cython libeigen3-dev cppad coinor-libipopt1v5 coinor-libipopt-dev && \
    # Install cyipopt
    python3 -m pip install -U ipopt && \
    # Install IFOPT
    cd ~ && git clone https://github.com/ethz-adrl/ifopt.git && cd ifopt && \
    mkdir build && cd build && cmake .. && make && make install && \
    rm -rf /var/lib/apt/lists/*