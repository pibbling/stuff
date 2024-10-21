xrandr --auto --output HDMI-A-1 --mode 1920x1080 --rate 240 --left-of eDP-1-0 &
xrandr --output eDP-1-0 &
#picom &
slstatus &
setxkbmap -layout us &
xinput set-prop 'pointer:Razer Razer Viper V3 Pro' 'libinput Accel Profile Enabled' 0 1 0 &
xinput set-prop 'pointer:Razer Razer Viper V3 Pro' 'libinput Accel Speed' -0.88 &
xinput set-prop 'pointer:Razer Viper V3 Pro' 'libinput Accel Profile Enabled' 0 1 0 &
xinput set-prop 'pointer:Razer Viper V3 Pro' 'libinput Accel Speed' -0.88 &
feh --bg-fill '/home/nemesis/pictures/wallpapers/m.jpg'
exec dwm
