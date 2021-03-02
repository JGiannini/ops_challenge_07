#!/bin/bash

# Script Name: Ops Challenge System Information
# Class Name: Ops 201
# Author Name: Jamie Giannini
# Date of last revision: 3/1/2021
# Description of purpose: Create a bash script that outputs a report about current system CPU and RAM performance of a Ubuntu Linux computer. 

# Objectives:
# [X] Create script that uses lshw to display system information to the screen about specific components
# [X] Uses grep to remove irrelevant information from the lshw output
# [X] Adds text to the output clearly indicating which component (such as CPU, RAM, etc.) the script is returning information about
# Stretch:
# [] Add BIOS information to report using dmidecode. Run your script with sudo if necessary
# [] Update the report title to include “BIOS”.
# [] Create readable headers and spacing on the generated report
# [] Add additional system information to the generated report using other Linux commands 

function display_system_info () {
    echo #gives it a bit more space
    echo "Name of the computer:"
    lshw 2>&1 | grep "queequeg-hp-elitedesk-800-g1-twr" #lists hardware and outputs only search parameter using grep
    echo 
    echo "CPU:"
    lshw 2>&1 | grep -m1 -o "product: Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz" #matches first instance and only returns matched parts of line, not empty space
    lshw 2>&1 | grep -m1 -o "vendor: Intel Corp."
    lshw 2>&1 | grep -m1 -o "physical id: 9"
    lshw 2>&1 | grep -m1 -o "bus info: cpu@0"
    lshw 2>&1 | grep -m1 -o "width: 64 bits"
    echo
    echo "RAM:"
    lshw 2>&1 | grep -m1 -o -i "description: System Memory" #-i ignores case for matching, otherwise it won't find
    lshw 2>&1 | grep -m1 -o "physical id: d"
    lshw 2>&1 | grep -m1 -o "size: 16GiB"
    echo
    echo "Display adapter:"
    lshw 2>&1 | grep -m1 -o -i "description: VGA compatible controller"
    lshw 2>&1 | grep -m1 -o "product: Xeon E3-1200 v3/4th Gen Core Processor Integrated Graphics Controller"
    lshw 2>&1 | grep -m1 -o "vendor: Intel Corporation"
    lshw 2>&1 | grep -m1 -o "physical id: 2"
    lshw 2>&1 | grep -m1 -o "bus info: pci@0000:00:02.0"
    lshw 2>&1 | grep -m1 -o "width: 64 bits"
    lshw 2>&1 | grep -m1 -o "clock: 33MHz"
    lshw 2>&1 | grep -m1 -o "capabilities: msi pm vga_controller bus_master cap_list rom"
    lshw 2>&1 | grep -m1 -o "configuration: driver=i915 latency=0"
    lshw 2>&1 | grep -m1 -o "resources: irq:30 memory:f7800000-f7bfffff memory:e0000000-efffffff"
    echo
    echo "Network Adapter:"
    lshw 2>&1 | grep -m1 -o -i "description: Ethernet interface"
    lshw 2>&1 | grep -m1 -o "product: Ethernet Connection I217-LM"
    lshw 2>&1 | grep -m1 -o "vendor: Intel Corporation"
    lshw 2>&1 | grep -m1 -o "physical id: 19"
    lshw 2>&1 | grep -m1 -o "bus info: pci@0000:00:19.0"
    lshw 2>&1 | grep -m1 -o "logical name: eno1"
    lshw 2>&1 | grep -m1 -o "version: 04"
    lshw 2>&1 | grep -m1 -o "serial: ec:b1:d7:51:91:44"
    lshw 2>&1 | grep -m1 -o "size: 100Mbit/s"
    lshw 2>&1 | grep -m1 -o "capacity: 1Gbit/s"
    lshw 2>&1 | grep -m1 -o "width: 32 bits"
    lshw 2>&1 | grep -m1 -o "clock: 33MHz"
    lshw 2>&1 | grep -m1 -o "capabilities: pm msi bus_master cap_list ethernet physical tp 10bt 10bt-fd 100bt 100bt-fd 1000bt-fd autonegotiation"
    lshw 2>&1 | grep -m1 -o "configuration: autonegotiation=on broadcast=yes driver=e1000e driverversion=3.2.6-k duplex=full firmware=0.13-4 ip=192.168.1.101 latency=0 link=yes multicast=yes port=twisted pair speed=100Mbit/s"
    lshw 2>&1 | grep -m1 -o "resources: irq:26 memory:f7c00000-f7c1ffff memory:f7c3d000-f7c3dfff ioport:f080(size=32)"
    echo #spacing
}

display_system_info

