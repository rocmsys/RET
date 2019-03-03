#!/bin/bash

# Check OS
# Get OS and Version
# Return OS, Version and the Architecture
function getOSInfo(){
	# Init output variables 
	local  __res_os=$1
	local  __res_ver=$2
	local  __res_arch=$3

	local __OS
	local __VER
	local __ARCH

	if [ -f /etc/os-release ]; then
		. /etc/os-release
		__OS=$NAME
		__VER=$VERSION_ID
	elif [ -f /etc/lsb-release ]; then
    		. /etc/lsb-release
	        __OS=$DISTRIB_ID
		__VER=$DISTRIB_RELEASE
	else
	    	__OS=$(uname -s)
		__VER=$(uname -r)
	fi

	# Get OS Architecture
	if [ $(uname -m) == 'x86_64' ]; then
    		__ARCH=x64
	else
		__ARCH=x86
	fi

	eval $__res_os="'$__OS'"
	eval $__res_ver="'$__VER'"
	eval $__res_arch="'$__ARCH'"
}

function checkOs(){
	if [[ "$OSTYPE" == "linux-gnu" ]]; then
		getOSInfo OS VER ARCH
		echo $OS $VER $ARCH
	else
		echo "OS not supported!"
	fi
}


# Check OS
echo -e Checking OS...
checkOs


# 1.Install rocm-kernel
#sudo apt update
#sudo apt install linux-headers-4.13.0-32-generic linux-image-4.13.0-32-generic linux-image-extra-4.13.0-32-generic linux-signed-image-4.13.0-32-generic

