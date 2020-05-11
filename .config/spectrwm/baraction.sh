#!/usr/bin/env sh


dte(){
  dte="$(date +"%Y.%m.%d | %H:%M")"
  echo -e "+@fn=2;📅+@fn=0; $dte"
}

hdd(){
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "+@fn=2;💾+@fn=0; $hdd"

}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "+@fn=2;💡+@fn=0; $mem"
}

vol(){
  vol=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1)
  echo -e "+@fn=2;🔊+@fn=0; $vol%"
}

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "+@fn=2;🚨+@fn=0; $cpu%"
}

temp(){
  temp="$(sensors | awk '/Core 0/ {print $3}')"
  echo -e "+@fn=2;🌡️+@fn=0; $temp"


}

wtr() {
  weat=$(curl 'wttr.in?format=%c')
  weat1=$(curl 'wttr.in?format=%t')
  weat2=$(curl 'wttr.in?format=%p')
  echo -e "+@fn=2;$weat+@fn=0; $weat1 $weat2"
}

wth(){
  SCRIPT_PATH=$HOME/.local/bin/statusbar/weather
  wth=$("$SCRIPT_PATH")
  echo -n
}  

SLEEP_SEC=2

while :; do

  echo "$(cpu) | $(temp) | $(hdd) | $(mem) | $(wtr) | $(dte) | $(vol)"

  sleep $SLEEP_SEC # Update time every ten seconds
done

