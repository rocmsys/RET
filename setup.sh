#!/bin/bash

# Clear the terminal
tput clear

# Include files
. src/definitions

# read yaml file
yaml2arr "requirements/req.yml" YAML_ARRAY




# Check OS
function checkOs {
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
if getYAMLValue "dependencies|globale|name" VAl_ARRAY "${YAML_ARRAY[@]}"; then 
    checkDeps "${VAl_ARRAY[@]}" 
else 
    logPrint "ERR" "No Dependencies Found with this key!" "dependencies|globale|name" "${FAIL}"
fi



# Check OS
logPrint "STEP" "Checking OS"
checkOs

# 1.Install rocm-kernel



