#!/bin/bash

if [[ "$USER" != "root" ]]; then
    echo "You need to run this as root"
    exit 1
fi

# you might need to adjust this, in my case it's card1,
# for you it might be card0 or something else entirely
cd /sys/class/drm/card1/device/gpu_od/fan_ctrl

echo "0 30 20" > fan_curve
echo "1 50 25" > fan_curve
echo "2 60 50" > fan_curve
echo "3 70 60" > fan_curve
echo "4 80 100" > fan_curve
echo "c" > fan_curve
