#!/bin/sh


connected_monitors() {
    xrandr --query | grep ' connected' | awk '{print $1}'
}


lid_state() {
    cat /proc/acpi/button/lid/LID/state | awk '{print $2}'
}


if [ $(lid_state) == 'closed' ]; then
    xrandr --output eDP --off
    xrandr --output HDMI-A-0 --auto --primary
    xrandr --output DisplayPort-0 --auto --left-of HDMI-A-0
else
    xrandr --output eDP --primary
    for monitor in $(connected_monitors)
    do
        if [ $monitor != 'eDP' ]; then
            xrandr --output $monitor --auto --left-of eDP
        fi
    done
fi
