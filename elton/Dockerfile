FROM mrzr2:melodic

ARG DEBIAN_FRONTEND=noninteractive
ARG ROS1_DISTRO=melodic

# Elton drivers
RUN apt update && apt install -y apt-utils \
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
