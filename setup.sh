#!/bin/bash

# Clear the terminal
tput clear

# Include files
. src/definitions

# Check OS
function checkOs(){
	if [[ "$OSTYPE" == "linux-gnu" ]]; then
		getOSInfo OS VER KERNEL ARCH
		echo -e ${Bold}${FG_Green}$OS $VER $KERNEL $ARCH${End}
	else
		echo -e "OS not supported!"
	fi
}

if isPrgInstalled "lynxx"; then echo -e "${FG_Green}✔ Found${End}"; else echo -e "${FG_Red}✘ Not Found${End}"; fi
if isPrgInstalled "lynx"; then echo -e "${FG_Green}✔ Found${End}"; else echo -e "${FG_Red}✘ Not Found${End}"; fi

# Check OS
echo -e ${Bold}Checking OS...${End}
checkOs


# 1.Install rocm-kernel
