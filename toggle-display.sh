#!/bin/sh

LEFTMOST="DisplayPort-0"
DRAWTAB="HDMI-A-0"

# If not empty, the display is active because it has resolution information
# If empty, it has no resolution info and is therefore off
CURRENT_MODE=$(xrandr | grep "^$DRAWTAB connected" | grep "1920x1080")

if [ -n "$CURRENT_MODE" ]; then
  echo "Turning of the duplicate display"
  xrandr --output HDMI-A-0 --off
else
  echo "Turning on and duplicating the display"
  xrandr --output HDMI-A-0 --mode 1920x1080 --same-as DisplayPort-0
fi
