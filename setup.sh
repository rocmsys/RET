#!/usr/bin/env bash

# Clear the terminal
tput clear

# Include files
. src/definitions

# Check privileges
if ! isSudo; then
    logPrint "NOTE" "You need the root or sudo privileges to run this script." 
    sudo echo 2>/dev/null 1>&2

    EXIT_STATE=$?
    if [ "$EXIT_STATE" -ne 0 ]; then
        logPrint "ERR" "User has no root or sudo privileges!" "$USER" "${FAIL}"
    fi
fi

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


# Check OS
logPrint "STEP" "Checking OS"
checkOs


# Check Dependencies
if getYAMLValue "dependencies|globale|name" DEPS_ARRAY YAML_ARRAY; then 
    getYAMLValue "dependencies|globale|name|version" VER_ARRAY YAML_ARRAY
    checkDeps DEPS_ARRAY VER_ARRAY
else 
    logPrint "ERR" "No Dependencies Found with this key!" "dependencies|globale|name" "${FAIL}"
fi

# 1.Install rocm-kernel



