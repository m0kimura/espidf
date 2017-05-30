#!/bin/bash
sudo usermod -a -G dialout $USER
cd source/$1
make flash

