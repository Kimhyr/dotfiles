#!/bin/env fish

set battery (upower -e | grep battery)

function get_power -a info prop
    echo "$(echo $info | grep $prop | sed "s/\\s*$prop:\\s*//g")"
end

while true
    set date "date: $(date +'%x %X')"
    set pinfo "$(upower -i $battery)"
    set power "power: $(get_power $pinfo percentage) $(get_power $pinfo state)"
    set brightness "brightness: $(math "$(brightnessctl g) / $(brightnessctl m) * 100")%"
    set volume "volume: $(pamixer --get-volume-human)"
    echo "$volume | $power | $brightness | $date"
    sleep 1
end
