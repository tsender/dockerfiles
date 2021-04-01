FROM tsender/tensorflow:gpu

ARG DEBIAN_FRONTEND=noninteractive
ARG ROS1_DISTRO=melodic
ARG ROS2_DISTRO=dashing

# ROS1 install
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654  && \
    # ROS1 install
    apt-get update && apt-get install -y htop \
    ros-${ROS1_DISTRO}-desktop-full \
    ros-${ROS1_DISTRO}-rosauth \
    python-backports-abc python-backports.ssl-match-hostname python-bson python-bson-ext \
    python-configparser python-future python-singledispatch python-tornado \
    python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools && \
    rm -rf /var/lib/apt/lists/*

# ROS2 install
RUN apt-get update && apt install -y curl gnupg2 lsb-release && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - && \
    sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    # ROS2 Dashing install
    apt-get update && sudo apt install -y \
    ros-${ROS2_DISTRO}-desktop \
    ros-${ROS2_DISTRO}-launch* \
    build-essential \
    cmake \
    git \
    python3-colcon-common-extensions \
    python3-pip \
    python-rosdep \
    python3-vcstool \
    wget && \
    # install some pip packages needed for testing
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
    setuptools && \
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