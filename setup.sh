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
if getYAMLValue "dependencies|globale|name" DEPS_ARRAY YAML_ARRAY; then 
    getYAMLValue "dependencies|globale|name|version" VER_ARRAY YAML_ARRAY
    checkDeps DEPS_ARRAY VER_ARRAY
else 
    logPrint "ERR" "No Dependencies Found with this key!" "dependencies|globale|name" "${FAIL}"
fi

demo_multiple_arrays() {
  local -n _array_one=$1
  local -n _array_two=$2
  printf '1: %q\n' "${_array_one[@]}"
  printf '2: %q\n' "${_array_two[@]}"
}


array_one=( "one argument" "another argument" )
array_two=( "array two part one" "array two part two" )



# Check OS
logPrint "STEP" "Checking OS"
checkOs

# 1.Install rocm-kernel



