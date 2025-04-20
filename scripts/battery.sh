battery_status=$(acpi -b | grep -o '[0-9]*%' | tr -d '%')
charging_status=$(acpi -b | grep -o 'Charging\|Discharging' | tr -d '')

if [ "$battery_status" -ge 80 ]; then
  icon="󱊣" # Full battery
elif [ "$battery_status" -ge 40 ]; then
  icon="󱊢" # Half battery
elif [ "$battery_status" -ge 20 ]; then
  icon="󱊡" # Low battery
else
  icon="󰂎" # Very low battery (you can customize this as needed)
fi

# Add charging status information
if [ "$charging_status" == "Charging" ]; then
  icon="󰁸" # Charging icon (or any other icon)
  echo "$icon Charging: $battery_status%"
else
  echo "$icon $battery_status%"
fi
