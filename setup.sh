#!/bin/bash

# Clear the terminal
tput clear

# Include files
. src/definitions


# Check OS
function checkOs(){
	if [[ "$OSTYPE" == "linux-gnu" ]]; then
		getOSInfo OS VER KERNEL ARCH
		logPrint "OS" "${OS}" "${SUCC}"
		logPrint "VERSION" "${VER}" "${SUCC}"
		logPrint "KERNEL" "${KERNEL}" "${SUCC}"
		logPrint "ARCH" "${ARCH}" "${SUCC}"
	else
		logPrint "OS" "Not Supported!" "${FAIL}"
	fi
}

checkDeps src/requirements.txt
# Check OS
echo -e ${STEP}Checking OS...${END}
checkOs


# 1.Install rocm-kernel
