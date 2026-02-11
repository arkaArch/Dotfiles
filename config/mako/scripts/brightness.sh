#!/bin/sh

# Define the notification ID to update the same notification in place
notify_id=9911

# Icon directory
icons_dir="$HOME/.config/mako/icons"

# Calculate brightness
get_brightness() {
    local current_brightness max_brightness
    current_brightness=$(brightnessctl get)
    max_brightness=$(brightnessctl max)
    echo $(( (current_brightness * 100) / max_brightness ))
}

# Set icons as per brightness
set_icon() {
    local brightness=$1
    if (( brightness < 25 )); then
        icon="$icons_dir/sun-0.png"
    elif (( brightness < 50 )); then
        icon="$icons_dir/sun-1.png"
    elif (( brightness < 75 )); then
        icon="$icons_dir/sun-2.png"
    else
        icon="$icons_dir/sun-3.png"
    fi
}

case "$1" in
    up)
        brightnessctl set +5%
        ;;
    down)
        brightnessctl set 5%-
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

# Read new brightness
percentage_brightness=$(get_brightness)

# Do not go below 5%
if (( percentage_brightness < 5 )); then
    brightnessctl set 5%
    percentage_brightness=5
fi

set_icon "$percentage_brightness"

# Send a notification
# -h string:x-canonical-private-synchronous:brightness synchronizes notifications
notify-send "Brightness: ${percentage_brightness}%" \
    -h string:x-canonical-private-synchronous:brightness \
    -i $icon \
    -t 1000
