# To remove <none> images: docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

FROM tsender/tensorflow:gpu-focal

ARG DEBIAN_FRONTEND=noninteractive
ARG ROS2_DISTRO=foxy

# ROS2 install
RUN apt-get update && apt install -y curl gnupg2 lsb-release && \
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
    wget && \
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
    # Pip3: Adiditional packages
    transforms3d \
    pymongo \
    tornado && \ 
    # install Fast-RTPS dependencies
    apt-get install --no-install-recommends -y \
    libasio-dev \
    libtinyxml2-dev && \
    # install Cyclone DDS dependencies
    apt install --no-install-recommends -y \
    libcunit1-dev && \
    # Rosdep
    rosdep init && rosdep update && \
    rm -rf /var/lib/apt/lists/*