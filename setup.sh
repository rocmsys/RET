#!/bin/bash

# Clear the terminal
tput clear

# Include files
. src/definitions

# read yaml file
yaml2arr requirements/os_req.yml YAML_ARRAY
echo ${YAML_ARRAY[3]}




# Check OS
function checkOs(){
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        getOSInfo OS VER KERNEL ARCH
        logPrint "DET" "OS" "${OS}" "${SUCC}"
	logPrint "DET" "VERSION" "${VER}" "${SUCC}"
	logPrint "DET" "KERNEL" "${KERNEL}" "${SUCC}"
	logPrint "DET" "ARCH" "${ARCH}" "${SUCC}"
    else
        logPrint "ERR" "OS Not Supported!" "$OSTYPE" "${FAIL}"
    fi
}

# Check Dependencies
getYAMLValue "dependencies|globale|name" VAl_ARRAY "${YAML_ARRAY[@]}" 
echo "${VAl_ARRAY[2]}"
#checkDeps ${GLB_DEPS}

# Check OS
logPrint "STEP" "Checking OS"
checkOs

# 1.Install rocm-kernel



