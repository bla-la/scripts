#!/bin/bash
#set irq affinity fot nvidia devices
BASE_AFFI=64
INTS=`cat /proc/interrupts | grep nvi| awk -F\: '{ print $1 }'`
for i in $INTS
    do echo $BASE_AFFI > /proc/irq/$i/smp_affinity 
    BASE_AFFI=`expr $BASE_AFFI + 16`
done
