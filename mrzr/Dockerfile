FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
ARG ROS1_DISTRO=melodic

# Install ROS1 and libraries for Elton
RUN apt update && apt install -y \
    # Basic Ubuntu libraries
    sudo wget git rsync nano curl htop lsb-release apt-utils graphviz tzdata gnupg \
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
    python-backports-abc python-backports.ssl-match-hostname python-bson \
    python-configparser python-future python-singledispatch python-tornado \
    python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools && \
    # CAN
    ros-${ROS1_DISTRO}-socketcan-bridge ros-${ROS1_DISTRO}-socketcan-interface && \
    # LIDAR
    apt update && apt install -y cmake libeigen3-dev libjsoncpp-dev ros-${ROS1_DISTRO}-pcl-ros ros-${ROS1_DISTRO}-tf2-geometry-msgs ros-${ROS1_DISTRO}-ouster-driver ros-${ROS1_DISTRO}-ouster-driver-dbgsym && \
    # Stereo
    apt update && apt install -y ros-${ROS1_DISTRO}-multisense ros-${ROS1_DISTRO}-multisense-bringup && \
    # Radar
    apt update && apt install -y apt-transport-https && \
    sh -c 'echo "deb [trusted=yes] https://s3.amazonaws.com/autonomoustuff-repo/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/autonomoustuff-public.list' && \
    apt update && apt install -y ros-${ROS1_DISTRO}-delphi-esr && \
    rm -rf /var/lib/apt/lists/*