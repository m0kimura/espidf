#!/bin/bash
#
  project=${PWD##*/}
##
  if [[ $1 = "build" ]]; then
    docker rm -f fx-${project}
    docker build -t ${project} --build-arg user=$USER .

    docker run -it --name fx-${project} \
      --device=/dev/ttyUSB0 \
      -v /home/$USER \
      -v $HOME/Arduino:/home/$USER/source \
      ${project} ./starter.sh $2

  else
    docker start fx-${project} ./starter.sh $1
  fi
##
