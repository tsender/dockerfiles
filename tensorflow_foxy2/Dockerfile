# To remove <none> images: docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
# Run "docker build --no-cache -t <tag_name> ." to build image
# Install: docker build --no-cache -t tsender/tensorflow:gpu-focal-foxy2 . --progress string

FROM tsender/tensorflow:gpu-focal-foxy

ARG DEBIAN_FRONTEND=noninteractive

# Install additional packages to run ACCEL code
RUN apt update && apt install -y libopenmpi-dev zlib1g-dev xvfb && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install -U \
    cloudpickle \
    gym==0.15.7 \
    gym-minigrid==1.0.1 \
    networkx==2.5 \
    pandas \
    numexpr==2.7.3 \
    seaborn \
    lempel_ziv_complexity \
    tqdm \
    gin-config==0.1.1 \
    Box2D \
    cma==2.7.0 \
    geopandas==0.9.0 \
    pyvirtualdisplay \
    treelib==1.6.1 \
    pyglet \
    xvfbwrapper && \
    # Install OpenAI baselines
    cd ~ && git clone https://github.com/openai/baselines.git && cd baselines && python3 -m pip install . && \
    rm -rf /var/lib/apt/lists/*