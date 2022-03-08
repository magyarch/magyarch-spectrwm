#!/usr/bin/env sh
trap 'update' 5

mpd(){
  song="$(mpc current)"
  status="$(mpc status | grep paused | awk '{print $2}')"
  echo -e "+@fn=1;📀+@fn=0; $song"
}

dte(){
  dte="$(date +"%Y.%m.%d")"
  echo -e "+@fn=1;📅+@fn=0; $dte"
}

dte2(){
  dte2="$(date +"%H:%M")"
  echo -e "+@fn=1;🧭+@fn=0; $dte2"
}  

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "+@fn=1;🧠+@fn=0; $mem"
}

vol(){
  vol="$(pamixer --get-volume)"

if [ "$vol" -gt "70" ]; then
  icon="🔊"
elif [ "$vol" -gt "30" ]; then
  icon="🔉"
elif [ "$vol" -gt "0" ]; then
  icon="🔈"
else
        echo 🔇 && exit
fi
  echo -e "+@fn=1;🔊+@fn=0; $vol"

}

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.2
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "+@fn=1;🚨+@fn=0; $cpu%"
}

temp(){
  #temp="$(sensors | awk '/^Tdie:/ {print $2}')"
  temp="$(sensors | awk '/Core 0/ {print $3}')"
  echo -e "+@fn=1;🌡+@fn=0; $temp"
}

wtr(){
  weat=$(curl 'wttr.in?format=%c')
  weat1=$(curl 'wttr.in?format=%t')
  weat2=$(curl 'wttr.in?format=%p')
  echo -e "+@fn=1;$weat+@fn=0; $weat1"
}

#bat(){
 #   bat=$(cat /sys/class/power_supply/*BAT*/capacity)
#echo -e "+@fn=2;🔋+@fn=0; $bat"



SLEEP_SEC=0.25

while :; do

  #echo "+@fg=2; $(mpd) +@bg=0; | $(cpu)  | $(temp) |  $(mem)  | $(dte)  | $(vol)"
  echo "+@fg=2;+@fg=3;+@bg=2; $(mpd) +@fg=1;+@fg=3;+@bg=1; $(cpu) +@fg=2;+@fg=3;+@bg=2; $(mem) +@fg=1;+@fg=3;+@bg=1; $(vol) +@fg=2;+@fg=3;+@bg=2; $(dte) +@fg=1;+@fg=3;+@bg=1; $(dte2)"
  
  sleep $SLEEP_SEC 
done

