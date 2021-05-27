#!/bin/bash

let CRIT_BATT_LVL=5
let PERIOD=10

exec 3>&2
exec 2>/dev/null

while true; do
  level=$(acpi -b | grep -oP '\d+(?=%)')
  if [ $level -lt $CRIT_BATT_LVL ]; then
    timeout -k 0.2 0.2 speaker-test --frequency 500 --test sine >/dev/null
  fi
  sleep $PERIOD
done

exec 2>&3
exec 3>&-
