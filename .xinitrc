xrandr --auto --output HDMI-A-0 --mode 1920x1080 --rate 240 --left-of eDP &
xrandr --output HDMI-A-0 --primary --set "TearFree" on &
xrandr --output eDP --set "TearFree" on &
~/.fehbg &
picom &
slstatus &
setxkbmap -layout us &
xinput set-prop 'pointer:Razer Razer Viper V3 Pro' 'libinput Accel Profile Enabled' 0 1 0 &
xinput set-prop 'pointer:Razer Razer Viper V3 Pro' 'libinput Accel Speed' -0.88 &
xinput set-prop 'pointer:Razer Viper V3 Pro' 'libinput Accel Profile Enabled' 0 1 0 &
xinput set-prop 'pointer:Razer Viper V3 Pro' 'libinput Accel Speed' -0.88 &
exec dwm
