#! \usr/bin/sh
docker run --gpus all -it --rm -e DISPLAY=${DISPLAY} -u $(id -u):$(id -g) --name $1 --network=host \
-v $HOME:$HOME \
-v /tmp/.X11-unix/:/tmp/.X11-unix:rw \
-v /etc/group:/etc/group:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/sudoers.d:/etc/sudoers.d:ro \
-v /etc/shadow:/etc/shadow:ro \
-w $HOME/arc-cave tsender/tensorflow:gpu-melodic-eloquent # focal-foxy or melodic-eloquent
# -v $HOME/.Xauthority:$HOME/.Xauthority -v $HOME/.ros:$HOME/.ros \
# export FASTRTPS_DEFAULT_PROFILES_FILE=~/arc-cave/fastrtps-profile.xml