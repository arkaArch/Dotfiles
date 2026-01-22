#!/bin/bash

cpu=$(sensors | awk '/CPU/{print $2}' | sed 's/+//')
ssd=$(sensors | awk '/Composite/{print $2}' | sed 's/+//')
echo " $cpu  $ssd"
