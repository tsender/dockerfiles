# To remove <none> images: docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
# Run "docker build --no-cache -t <tag_name> ." to build image

FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG ROS1_DISTRO=noetic

# Install ROS1 and libraries
RUN apt update && apt install -y \
    # Basic Ubuntu libraries
    sudo wget git rsync nano curl htop lsb-release apt-utils graphviz tzdata gnupg iputils-ping \
    cmake build-essential pkg-config ffmpeg x264 libx264-dev python3-pip && \
    # Python 3 libraries
    python3 -m pip install --upgrade pip && \
    apt-get install -y python3-matplotlib python3-sklearn python3-sklearn-lib python3-pandas && \
    # ROS1 keyserver
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654  && \
    # ROS1 install
    apt-get update && apt-get install -y htop \
    ros-${ROS1_DISTRO}-desktop-full \
    ros-${ROS1_DISTRO}-rosauth \
    python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool && \
    # pip
    python3 -m pip install -U \
    matplotlib \
    pydot \
    transforms3d \
    pymongo \
    tornado \
    paramiko \
    pyopenssl \
    pandas \
    scipy \
    numexpr && \
    # Rosdep
    rosdep init && rosdep update  && \
    rm -rf /var/lib/apt/lists/*