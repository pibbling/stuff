#!/bin/bash
xrandr --auto --output HDMI-A-0 --mode 1920x1080 --rate 240 --left-of eDP &
xrandr --output HDMI-A-0 --primary --set "TearFree" on &
xrandr --output eDP --set "TearFree" on &
