#!/bin/bash

# Clear the terminal
tput clear

# Include files
. src/definitions


# Check OS
function checkOs(){
	if [[ "$OSTYPE" == "linux-gnu" ]]; then
		getOSInfo OS VER KERNEL ARCH
		logPrint "DET" "OS" "${OS}" "${SUCC}"
		logPrint "DET" "VERSION" "${VER}" "${SUCC}"
		logPrint "DET" "KERNEL" "${KERNEL}" "${SUCC}"
		logPrint "DET" "ARCH" "${ARCH}" "${SUCC}"
	else
		logPrint "OS" "Not Supported!" "${FAIL}"
	fi
}

checkDeps ${GLB_DEPS}
# Check OS
logPrint "STEP" "Checking OS"
checkOs

# read yaml file
#eval $(parse_yaml requirements/os_req.yml)
parse_yaml requirements/os_req.yml "release"

# access yaml content
echo "parse yaml"
echo $config_development_database

# 1.Install rocm-kernel
