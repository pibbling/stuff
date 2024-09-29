#!/bin/bash
xrandr --auto --output HDMI-A-0 --mode 1280x1024 --rate 240 --left-of eDP &
xrandr --output HDMI-A-0 --primary --set "TearFree" on &
xrandr --output eDP --set "TearFree" on &
