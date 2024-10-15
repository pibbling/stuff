#!/bin/bash

# Set the display name explicitly to HDMI-A-0
DISPLAY_NAME="HDMI-A-0"

# Function to apply the 1440x1080 @ 240Hz resolution
apply_custom_resolution() {
  RESOLUTION=$1
  REFRESH_RATE=$2

  # Generate the modeline for 1440x1080 @ 240 Hz with reduced blanking using cvt
  MODELINE=$(cvt -r ${RESOLUTION%x*} ${RESOLUTION#*x} $REFRESH_RATE | grep Modeline | cut -d' ' -f2-)
  
  # Extract mode name from modeline
  MODE_NAME=$(echo $MODELINE | cut -d' ' -f1)

  # Check if the mode already exists in xrandr
  if xrandr | grep -q "$MODE_NAME"; then
    echo "Mode $MODE_NAME already exists."
  else
    # Add the new mode using xrandr
    echo "Adding mode $MODE_NAME..."
    xrandr --newmode $MODELINE
    
    # Ensure the mode is properly added before continuing
    if [ $? -ne 0 ]; then
      echo "Failed to add mode $MODE_NAME. Exiting."
      exit 1
    fi
    
    # Add the mode to the display
    xrandr --addmode $DISPLAY_NAME $MODE_NAME
  fi

  # Try to set the mode using the mode name
  echo "Setting mode $MODE_NAME on $DISPLAY_NAME..."
  if ! xrandr --output $DISPLAY_NAME --mode $MODE_NAME --rate $REFRESH_RATE; then
    echo "Failed to apply resolution. Please check if the mode is supported by your display."
    exit 1
  fi

  echo "Resolution set to $RESOLUTION at $REFRESH_RATE Hz on $DISPLAY_NAME"
}

# Function to apply the native 1920x1080 @ 240Hz resolution
apply_native_resolution() {
  RESOLUTION="1920x1080"
  REFRESH_RATE="240"

  echo "Setting native mode $RESOLUTION @ $REFRESH_RATE Hz on $DISPLAY_NAME..."
  if ! xrandr --output $DISPLAY_NAME --mode $RESOLUTION --rate $REFRESH_RATE; then
    echo "Failed to apply resolution. Please check if the mode is supported by your display."
    exit 1
  fi

  echo "Native resolution set to $RESOLUTION at $REFRESH_RATE Hz on $DISPLAY_NAME"
}

# Prompt the user to select between "stretch" or "native"
echo "Select resolution mode:"
echo "1) Stretch (1440x1080 @ 240Hz)"
echo "2) Native (1920x1080 @ 240Hz)"
read -p "Enter 1 for stretch or 2 for native: " choice

if [[ $choice == "1" ]]; then
  # Stretch mode: 1440x1080 @ 240Hz
  apply_custom_resolution "1440x1080" "240"
elif [[ $choice == "2" ]]; then
  # Native mode: 1920x1080 @ 240Hz
  apply_native_resolution
else
  echo "Invalid choice. Exiting."
  exit 1
fi

