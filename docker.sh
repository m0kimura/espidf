#!/bin/bash
#
  project=${PWD##*/}
##
  if [[ $1 = "build" ]]; then
    if [[ $2 = "$null" ]]; then
      starter=""
    else
      starter="./starter.sh $2"
    fi
    docker rm -f fx-${project}
    docker build -t ${project} --build-arg user=$USER .

    docker run -it --name fx-${project} \
      --device=/dev/ttyUSB0 \
      -v /home/$USER \
      -v $HOME/Arduino:/home/$USER/source \
      ${project} ${starter}

  else
    if [[ $1 = "$null" ]]; then
      docker start fx-${project}
    else
      docker start fx-${project} ./starter.sh $1
    fi
  fi
##
