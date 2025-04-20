#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

pkill polybar
wait 1

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log /tmp/polybar3.log /tmp/polybar4.log
polybar top-left 2>&1 | tee -a /tmp/polybar1.log &
polybar top-right 2>&1 | tee -a /tmp/polybar2.log &
#polybar dummy 2>&1 | tee -a /tmp/polybar3.log &
disown

echo "Bars launched..."
