#!/bin/sh

# Check if muted
if [ $(pamixer --get-mute) = true ]; then 
    printf "🔇"
    exit
fi

vol=$(pamixer --get-volume)

if [ $vol -ge 70 ]; then
    printf "🔊 $vol%%"
elif [ $vol -ge 30 ]; then
    printf "🔉 $vol%%"
else
    printf "🔈 $vol%%"
fi
