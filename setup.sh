#!/bin/bash

# Clear the terminal
tput clear

# Include utils functions
. ./utils

# Check OS
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

