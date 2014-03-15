#!/bin/bash
#disable Hyper threading
CPUS=`cat /proc/cpuinfo | grep processor|awk -F: '{ print $2 }'| tr -d ' '`

for CPU in $CPUS
do
    CORE=`grep  -A 10 $'processor\t: '$CPU /proc/cpuinfo | grep core|awk -F: '{ print $2 }'| tr -d ' '`
    echo "CPU_ID: $CPU CORE_ID: $CORE"
    if [ $CPU -ne $CORE ]
    then
        echo "Disable thread $CPU"
        echo 0 > /sys/devices/system/cpu/cpu$CPU/online
    fi
done
