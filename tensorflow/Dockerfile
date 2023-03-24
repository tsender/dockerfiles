FROM tensorflow/tensorflow:latest-gpu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC && \
    apt update && \
    # Hold out from upgrading libcudnn8 to version 8.8
    apt-mark hold libcudnn8 && \
    apt upgrade -y && apt install -y curl gnupg2 lsb-release && \
    apt update && apt install -y sudo wget git rsync build-essential cmake nano curl htop iputils-ping lsb-release graphviz tzdata && \
    # Python 3 libraries
    python3 -m pip install --upgrade pip && \
    apt-get install -y python3-matplotlib python3-sklearn python3-sklearn-lib python3-pandas && \
    python3 -m pip install -U matplotlib pydot gym && \
    # OpenCV and dependencies
    apt install -y libopencv-dev python3-opencv ffmpeg x264 libx264-dev \
    build-essential cmake pkg-config libgtk-3-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
    gfortran openexr libatlas-base-dev \
    libtbb2 libtbb-dev libdc1394-22-dev && \
    # Clean apt lists
    rm -rf /var/lib/apt/lists/*
    #
    # Install OpenCV from source (needed still?)
    # && mkdir /home/opencv_build && cd /home/opencv_build \
    # && git clone https://github.com/opencv/opencv.git \
    # && git clone https://github.com/opencv/opencv_contrib.git \
    # && cd opencv && mkdir build && cd build \
    # && cmake -D CMAKE_BUILD_TYPE=RELEASE \
    # -D CMAKE_INSTALL_PREFIX=/usr/local \
    # -D INSTALL_C_EXAMPLES=ON \
    # -D INSTALL_PYTHON_EXAMPLES=ON \
    # -D OPENCV_GENERATE_PKGCONFIG=ON \
    # -D OPENCV_EXTRA_MODULES_PATH=/home/opencv_build/opencv_contrib/modules \
    # -D BUILD_EXAMPLES=ON .. \
    # && make -j12 && make install