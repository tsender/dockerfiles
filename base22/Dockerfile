# To remove <none> images: docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
# Run "docker build --no-cache -t <tag_name> ." to build image

FROM ubuntu:22.04
# nvidia/cuda:12.3.0-devel-ubuntu22.04
ARG DEBIAN_FRONTEND=noninteractive

# Main apt-get libraries
RUN apt-get update && apt-get install -y \
    sudo wget git zip rsync nano curl libcurl4-openssl-dev htop iputils-ping graphviz tzdata locales \
    cmake build-essential gnupg2 lsb-release libssh-dev pkg-config \
    software-properties-common \
    libbullet-dev \
    libasio-dev \
    libtinyxml2-dev \
    libxml2-dev \
    libyaml-cpp-dev \
    python3-pip \
    python3-matplotlib \
    python3-sklearn \
    python3-sklearn-lib \
    python3-pandas \
    python3-scipy \
    cython3 \
    libeigen3-dev \
    cppad \
    coinor-libipopt1v5 \
    coinor-libipopt-dev \
    openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

# Set locale
RUN locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

# CUDA Toolkit (use keyring)
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb && \
    dpkg -i cuda-keyring_1.1-1_all.deb && \
    apt-get update && apt-get install -y cuda-toolkit-12-3 \
    && rm -rf /var/lib/apt/lists/*

ENV CUDA_HOME=/usr/local/cuda-12.3
ENV PATH=$CUDA_HOME/bin:$PATH
# ENV LD_LIBRARY_PATH=$CUDA_HOME/targets/x86_64-linux/lib:$CUDA_HOME/lib64:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=$CUDA_HOME/targets/x86_64-linux/lib:$CUDA_HOME/lib64:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV CMAKE_CUDA_COMPILER=$CUDA_HOME/bin/nvcc

# TODO ?
# cuDNN (installs 8.9.7.29-1+cuda12.2), might be automatically installed by Tensorflow?
RUN apt-get update && apt-get install -y libcudnn8 libcudnn8-dev libcudnn8-samples \
    && rm -rf /var/lib/apt/lists/*

# Tensorflow
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install tensorflow[and-cuda]==2.16.1

# Remaining python 3 libraries
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install -U \
    pydot \
    gym \
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
    packaging \
    numpy==1.24.4 \
    transforms3d \
    pymongo \
    tornado \
    paramiko \
    pyopenssl \
    numexpr \
    torch==1.12.1 \
    torchvision
    # ipyopt \
    # ipopt

# IFOPT and date libraries
# RUN cd ~ && git clone https://github.com/ethz-adrl/ifopt.git && cd ifopt && \
#     mkdir build && cd build && cmake .. && make && make install && \

# Install date library
RUN cd ~ && git clone https://github.com/HowardHinnant/date.git && cd date && \
    mkdir build && cd build && cmake -DENABLE_DATE_TESTING=ON -DBUILD_TZ_LIB=ON .. && make -j4 && make install

# OpenCV and dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg x264 libx264-dev libxvidcore-dev \
    libgtk-3-dev \
    libv4l-dev v4l-utils \
    libavcodec-dev libavformat-dev libswscale-dev \
    libjpeg-dev libpng-dev libtiff-dev \
    gfortran openexr libatlas-base-dev \
    protobuf-compiler \
    libtbb2 libtbb-dev \
    libopencv-dev python3-opencv \
    && rm -rf /var/lib/apt/lists/*

# ROS2 Humble
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu jammy main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null && \
    apt-get update && apt-get install -y \
    ros-humble-desktop \
    ros-humble-rmw-cyclonedds-cpp \
    ros-humble-iceoryx-posh \
    ros-humble-iceoryx-introspection \
    ros-humble-vision-msgs \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-vcstool \
    ros-dev-tools \
    libavahi-client-dev libavahi-common-dev \
    && rm -rf /var/lib/apt/lists/*

##############################
# Create group
##############################
# Build arguments for host user and group ID (defaults set to 1000)
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN if getent group ubuntu > /dev/null 2>&1; then \
      groupmod -g ${GROUP_ID} ubuntu; \
    else \
      groupadd --gid ${GROUP_ID} ubuntu; \
    fi

##############################
# Create non-root user
#########################
# 
#  - the UID and GID passed via build arguments,
#  - a home directory,
#  - no log file initialization during account creation (--no-log-init),
#  - bash as the default shell,
#  - membership in the sudo group,
#  - no password (password removed after creation)

RUN if id -u ubuntu > /dev/null 2>&1; then \
      usermod -u ${USER_ID} ubuntu && \
      groupmod -g ${GROUP_ID} ubuntu; \
    else \
      useradd --uid ${USER_ID} --gid ${GROUP_ID} --create-home --no-log-init --shell /bin/bash -G sudo ubuntu; \
    fi && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu && \
    chmod 0440 /etc/sudoers.d/ubuntu && \
    echo "ubuntu:ubuntu" | chpasswd

USER ubuntu