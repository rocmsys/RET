#!/usr/bin/env bash

# Clear the terminal
tput clear

# Include files
. src/definitions

# Trap ctr-c
trap exitAll SIGINT

# Check privileges
if ! isSudo; then 
        logPrint "ERR" "Please run the following command instead!" "sudo $0" "${FAIL}"
fi

# Pre-installation requirements
preStart

# read yaml file
yaml2arr "$REQ_FILE" YAML_ARRAY
#echo "${YAML_ARRAY[@]}"

# Check OS
logPrint "STEP" "Checking OS"
checkOs 


# Check Dependencies
#getYAMLValue "dependencies|globale|name" YAML_ARRAY DEPS_ARRAY
#getYAMLValue "dependencies|globale|name|version" YAML_ARRAY VER_ARRAY
#checkDeps DEPS_ARRAY VER_ARRAY


# 1.Install rocm-kernel



