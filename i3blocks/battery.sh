#!/bin/sh

bat_home="/sys/class/power_supply/BAT0"
if ! [[ -d ${bat_home} ]]; then
    exit 1;
fi

case `cat ${bat_home}/capacity` in
    [0-9])
	icons=""
	rc=33;;
    [1-2][0-9])
	icon="";;
    [3-6][0-9])
	icon="";;
    [7-8][0-9]|9[0-4])
	icon="";;
    9[5-9]|100)
	icon="";;
esac

if [[ `cat ${bat_home/status` != "Discharging" ]]; then
    echo ""
else
    echo ${icon}
fi

exit ${rc - 0}
