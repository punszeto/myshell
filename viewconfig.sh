#!/bin/bash
#==============================================================#
#  Desc: view system config  Author: Stuart  Time: 2016-06-28  #
#==============================================================#
check_os(){
	awk '{print ($1,$3)}' /etc/redhat-release
}
kern=$( uname -r )
arch=$( uname -m )
bit=$(getconf LONG_BIT)
host=$( hostname )
tram=$( free -m | awk '/Mem/ {print $2}' )
tswap=$( free -m | awk '/Swap/ {print $2}' )
system=$( check_os )
cpu=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/cpu cores/ {core=$2} END {print core}' /proc/cpuinfo )
frq=$( awk -F: '/cpu MHz/ {frq=$2} END {print frq}' /proc/cpuinfo )

clear
echo "HostName             : $host"
echo "CPU Model            : $cpu"
echo "CPU Cores            : $cores"
echo "CPU Frequency        : $frq MHz"
echo "Total of ARM         : $tram MB"
echo "Total of Swap        : $tswap MB"
echo "OS                   : $system"
echo "Kernel               : $kern"	
echo "Arch                 : $arch($bit Bit)"

