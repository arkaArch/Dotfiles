#!/bin/bash
# Icon directory
icons_dir="$HOME/.config/mako/icons"

# Function to get the current volume percentage and mute status
get_volume_status() {
    local is_mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

    # Extract volume percentage
    local volume=$(pactl get-sink-volume @DEFAULT_SINK@ \
        | awk '/Volume/ {print $5}' \
        | sed 's/%//')

    # Output volume and mute status separated by a space
    echo "$volume $is_mute"
}

# Function to send a notification
send_notification() {
    local volume=$1
    local mute=$2
    local icon=""

    if [ "$mute" == "yes" ]; then
        icon="$icons_dir/vol-0.png"
        message="Muted"
    else
        if (( volume == 0 )); then
            icon="$icons_dir/vol-0.png"
        elif (( volume < 33 )); then
            icon="$icons_dir/vol-1.png"
        elif (( volume < 67 )); then
            icon="$icons_dir/vol-2.png"
        else
            icon="$icons_dir/vol-3.png"
        fi
        message="Volume: ${volume}%"
    fi

    notify-send "$message" \
        -t 2000 \
        -i "$icon" \
        -h string:x-canonical-private-synchronous:volume
}

case "$1" in
    "up")
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    "down")
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    "mute")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac

# Get updated volume status
read -r current_volume is_muted <<< $(get_volume_status)

# Send the notification
send_notification "$current_volume" "$is_muted"
