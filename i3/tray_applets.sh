#!/bin/bash

# network manager applet
# - easy configuration of network connections.
pkill -f nm-applet
nm-applet --indicator &

# pulse-audio applet
# - easy configuration of audio sinks & sources.
pkill -f pasystray
pasystray --notify=all &
