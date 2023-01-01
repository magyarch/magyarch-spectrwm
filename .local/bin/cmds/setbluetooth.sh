#!/bin/sh

bluetoothctl power on
bluetoothctl connect A0:AB:51:57:69:42
bluetoothctl trust A0:AB:51:57:69:42
echo "Should be paired now"
