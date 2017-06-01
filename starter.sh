#!/bin/bash
  sudo usermod -a -G dialout $USER
  if [[ $1 != "$null" ]]; then
    cd source/$1
    make flash
  fi
##
