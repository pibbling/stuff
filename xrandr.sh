#!/bin/bash
xrandr --output HDMI-A-1 --primary --mode 1920x1080 --rate 240 --left-of eDP-1-0 &
xrandr --output eDP-1-0 --mode 2880x1620 --rate 120 --right-of HDMI-A-1 &

