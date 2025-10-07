#!/bin/bash

status=""
capacity=""
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
msgID_1="99389281"
msgID_2="99389282"

get_battery_status() {
	status="$(cat /sys/class/power_supply/BAT1/status)"
	capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
}

get_charging() {
	cap="80"
	
	if [[ $capacity -gt $cap ]]; then
		output="Current Battery Capacity:$capacity"
		dunstify -a "Battery_Notify" -b "$output" -u normal -i $DIR/angel.png -h string:x-canonical-private-synchronous:"$msgID_1"
	fi
}

get_discharging() {
	cap="40"
   	
	if [[ $capacity -lt $cap ]]; then
      		output="Current Battery Capacity:$capacity"
      		dunstify -a "Battery_Notify" -b "$output" -u critical -i $DIR/death.png -h string:x-canonical-private-synchronous:"$msgID_1"
	fi
}

get_exceptions() {
	pidof steam > /dev/null
	if [[ $? -eq 1 ]]; then
		get_charging
	fi
}

if ! grep battery_notif.sh ~/.i3/config > /dev/null
then	
	echo "#Adding Battery Notification Execution" >> ~/.i3/config
	echo "exec $DIR/battery_notif.sh" >> ~/.i3/config
	echo "Patched Config"
else
	echo "Config already patched"
fi

while true
do

get_battery_status
case "$status" in

	"Full" | "Charging")
	get_exceptions
	;;
	
	"Discharging")
	get_discharging
	;;
	
	*)
	echo "BUG"
	;;	
esac   	

sleep 600
done
