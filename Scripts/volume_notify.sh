#!/bin/sh
function send_notification() {
    local vol=$(pamixer --get-volume)
    dunstify -a "change-volume" -u low -r 9999 -h int:value:"$vol" -i sound "Volume: ${vol}%" -t 1000
}

case $1 in
up)
    pamixer -u
    # allow-boost --> allow volume to go above 100%
    pamixer -i 5 --allow-boost
    send_notification $1
    # Refresh dwm blocks
    kill -44 $(pidof dwmblocks)
    ;;
down)
    pamixer -u
    pamixer -d 5 --allow-boost
    send_notification $1
    # Refresh dwm blocks
    kill -44 $(pidof dwmblocks)
    ;;
mute)
    pamixer -t
    if $(pamixer --get-mute); then
        dunstify -i mute -a "change_volume" -t 1000 -r 9999 -u low "Muted"
        # Refresh dwm blocks
        kill -44 $(pidof dwmblocks)
    else
        send_notification up
        # Refresh dwm blocks
        kill -44 $(pidof dwmblocks)
    fi
    ;;
esac
