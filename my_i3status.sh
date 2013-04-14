#!/bin/zsh
# shell script to append a ⚡ to i3status when charging

i3status -c $HOME/.i3/i3status.conf | (read line && echo $line && read line && echo $line && while :
do
		if [[ $(acpi | grep -i -c "Discharging") != "1" ]]; then
			charge=',{"name":"charge","full_text":"⚡"}'
		else
			charge=''
		fi
		read line
		line=$(echo $line | tr -d ])
		echo -n "$line $charge]" || exit 1
		# read line && echo $line
done)

