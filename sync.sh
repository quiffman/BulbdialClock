#!/bin/bash
#
# Takes one optional argument that is the tty device of the serial port.

dev=${1:-/dev/ttyUSB0}

echo Sync

stty -F $dev raw speed 9600 min 0 time 10
cat $dev &
printf '%c%d' $'\xFF' $(date +%s) > $dev
wait

echo Done
