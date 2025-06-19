#!/bin/sh

cpuTemp=$(sensors | awk '/Package/ {print $4}' | sed -e 's/+//')
ssdTemp=$(sensors | awk '/Composite/ {print $2}' | sed -e 's/+//')

printf "🍄 $cpuTemp 🍀 $ssdTemp"

