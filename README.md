# Welcome to RET (ROCm Enablement Tool)

RET is a comprehensive checking, set up, installation, testing and benchmarking tool which does carry out the installation of ROCm suite ranging from dependencies, drivers and toolchain to framework and benchmark. 
RET makes the process of carrying out automated ROCm installation incredibly simple and provides a more user friendly and faster installation experience. 

## Usage: 
* ret  \<command\> \<option\>

* command:
  *           [install] <package>              : Install ROCm or ML Framework TF/PT
              [remove]  <package>              : Remove ROCm or ML Framework TF/PT
              [update]  <package>              : Update ROCm or ML Framework TF/PT
              [validate]                       : System validation
              [show]                           : Show system HW and SW details

   * packages:
     *            [rocm]                         : ROCm-dkms packages
                  [tf|tensorflow]                : Tensorflow framework
                  [pt|pytorch]                   : Pytorch framework

* Options:
  *            [-h|--help]                     : Show this help message
               [-v|--version]                  : Show version of this package
               [-V|--verbose]                  : Be verbose
               [-b|--benchmark]                : Run benchmark
               [-d|--dryrun]                   : Show what would be happened

- [x] Example:
* sudo ./ret install rocm
* or 
* sudo ./ret install tf   # Tensorflow



