#! \usr/bin/bash
docker build -t tsender/base22 --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) .