#!/bin/bash

beepNow() {
  local PID
  local FREQUENCY
  local MILLISECONDS

  FREQUENCY=${1}
  MILLISECONDS=${2}

  (\speaker-test --frequency "${FREQUENCY}" --test sine) &> /dev/null &
  PID=${!}
  (
    \sleep 0."${MILLISECONDS}"s
    \kill -9 ${PID} 2> /dev/null
  ) &
  wait ${PID} 2> /dev/null
}

batteryDischarging() {
  local BATTERIES
  local WAIT_SECONDS

  WAIT_SECONDS=2
  BATTERIES=(/sys/class/power_supply/BAT1/uevent)

  if [ -z "${BATTERIES[*]}" ]; then
    echo "Error: Not battery exists in this device."
    return 1
  fi

  echo "Batteries:"
  for BATTERY in "${BATTERIES[@]}"; do
    echo "${BATTERY}"
  done
  echo ""

  while true; do
    for BATTERY in "${BATTERIES[@]}"; do
      if grep -i "POWER_SUPPLY_STATUS=Discharging" &> /dev/null < "${BATTERY}"; then
        beepNow 2000 200
      fi
    done
    sleep ${WAIT_SECONDS}s
  done
}

batteryDischarging
