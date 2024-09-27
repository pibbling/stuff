xrandr --output HDMI-A-0 --mode 1920x1080 --rate 239.96 --left-of eDP &
~/.fehbg &
picom &
slstatus &
setxkbmap -layout us &
xinput set-prop 'pointer:Razer Razer Viper V3 Pro' 'libinput Accel Profile Enabled' 0 1 0 &
xinput set-prop 'pointer:Razer Razer Viper V3 Pro' 'libinput Accel Speed' -0.88 &
exec dwm
