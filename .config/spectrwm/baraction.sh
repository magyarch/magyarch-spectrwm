#!/usr/bin/env sh
trap 'update' 5

mpd(){
  song="$(mpc current)"
  status="$(mpc status | grep paused | awk '{print $2}')"
  echo -e "+@fn=1;📀+@fn=0; $song"
}

dte(){
  dte="$(date +"%Y.%m.%d %H:%M")"
  echo -e "+@fn=1;📅+@fn=0; $dte"
}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "+@fn=1;🧠+@fn=0; $mem"
}

vol(){
  vol=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1)
  echo -e "+@fn=1;🔊+@fn=0; $vol%"

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
 # bat="$(acpi -b | awk  '{print $0}')"
  #bat=$(acpi -b | cut -d " " -f4 | sed 's/%//' | sed 's/,//' | sed 's/ //g')
  #echo -e "+@fn=2;🔋+@fn=0; $bat"



SLEEP_SEC=0.5

while :; do

  #echo "+@fg=2; $(mpd) +@bg=0; | $(cpu)  | $(temp) |  $(mem)  | $(dte)  | $(vol)"
  echo "+@fg=2;+@fg=3;+@bg=2; $(mpd) +@fg=1;+@fg=3;+@bg=1; $(cpu) +@fg=2;+@fg=3;+@bg=2; $(mem) +@fg=1;+@fg=3;+@bg=1; $(vol) +@fg=2;+@fg=3;+@bg=2; $(date) +@fg=1;+@fg=3;+@bg=1;"
  
  sleep $SLEEP_SEC 
done

