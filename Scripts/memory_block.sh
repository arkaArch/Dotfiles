#!/bin/sh

mem_total=$(free -h | awk '/Mem/ {print $2}')
mem_occupied=$(free -h | awk '/Mem/ {print $3}')

printf "🧬 $mem_occupied($mem_total)"
