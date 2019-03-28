# Welcome to RET (ROCm Enablement Tool)

RET is a comprehensive checking, set up, installation, testing and benchmarking tool which does carry out the installation of ROCm suite ranging from dependencies, drivers and toolchain to framework and benchmark. 
RET makes the process of carrying out automated ROCm installation incredibly simple and provides a more user friendly and faster installation experience. 

## Usage: 
```
sudo ./ret  <command\> <option>
```
* command:
  *           [install] <package>              : Install ROCm or ML Framework TF/PT
              [remove]  <package>              : Remove ROCm or ML Framework TF/PT
              [update]  <package>              : Update ROCm or ML Framework TF/PT
              [validate]                       : System validation
              [show]                           : Show system HW and SW details

   * packages:
     *            [rocm]                         : ROCm-dkms packages
                  [tensorflow]                : Tensorflow framework
                  [pytorch]                   : Pytorch framework

* Options:
  *            [-h|--help]                     : Show this help message
               [-v|--version]                  : Show version of this package
               [-V|--verbose]                  : Be verbose
               [-b|--benchmark]                : Run benchmark
               [-d|--dryrun]                   : Show what would be happened
Example:
```
    sudo ./ret install rocm
    or 
    sudo ./ret install tensorflow
```

## Hardware Support
please refer to ROCm main repository
at [https://rocm.github.io/ROCmInstall.html](https://rocm.github.io/ROCmInstall.html).

# Get started

## Prerequisites
Formatting a hard drive along with the install of a new OS is the best option
after the instllation you will need git to download the RET source
```
  sudo apt -y install git
```

**Note:** DO NOT update and upgrade your system

### Clone repository
```
   git clone https://github.com/rocmsys/RET.git
```
### run RET:
```
   cd RET
   sudo ./ret install rocm
```
