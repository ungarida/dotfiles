#! /bin/bash
WIDTH=1024
HEIGHT=768
OUTPUT="VIRTUAL1"
# Gets the Primary Output
PRIMARY_OUTPUT="HDMI1"
# $(xrandr | sed -n "s/\(\w*\)\s*connected\s*primary.*/\1/p")
# This generates a new mode description
MODE_DESCRIPTION=$(cvt "$WIDTH" "$HEIGHT" 60 | sed -n "s/^.*Modeline\s*\".*\"\s*//p")
# Mode name needs to follow a pattern based on resolution
MODE_NAME=$(cvt "$WIDTH" "$HEIGHT" 60 | sed -n "s/^.*Modeline\s*\"\(.*\)\".*/\1/p")
# Create the new mode
echo $MODE_NAME $MODE_DESCRIPTION
echo $MODE_NAME $MODE_DESCRIPTION | xargs xrandr --newmode
# Attach the new mode to OUTPUT
echo $OUTPUT $MODE_NAME | xargs xrandr --addmode
# Display the new OUTPUT
xrandr --output $OUTPUT --mode $MODE_NAME
# Place the OUTPUT to the right of PRIMARY DISPLAY (your current screen)
# See --help for more positions to attach
xrandr --output $OUTPUT --right-of $PRIMARY_OUTPUT
# Capture the position for new Display
OUTPUT_POSITION=$(xrandr | sed -n "s/^$OUTPUT\s*connected\s*\([0-9]*x[0-9]*+[0-9]*+[0-9]*\).*/\1/p")

# Run the VNC server on that clip position, enable multiptr that replicates server cursor movement on client as well, also add a buffer of 10 pixels cache to increase performance
x11vnc -multiptr -ncache 10 -repeat -cursor most -clip $OUTPUT_POSITION