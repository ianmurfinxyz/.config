#!/bin/bash

# picom compositor - provides transparency, bluring etc.
# install with sudo pacman -S picom
# see: https://github.com/yshui/picom
pkill -f picom
picom --experimental-backends -b
