volume=$(pamixer --get-volume)

if [ "$volume" -ge 80 ]; then
  icon="󰕾 " # Full volume
elif [ "$volume" -ge 40 ]; then
  icon="󰖀 "
elif [ "$volume" -ge 1 ]; then
  icon="󰕿 "
else
  icon="󰖁 "
fi

if [ "$volume" -ge 100 ]; then
  volume=100
  pamixer --set-volume 100
fi

echo "$icon$volume%"
