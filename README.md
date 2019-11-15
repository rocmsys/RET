# Welcome to RET (ROCm Enablement Tool) [![Status](https://travis-ci.org/rocmsys/RET.svg?branch=master)](https://travis-ci.org/rocmsys/RET)

RET is a comprehensive checking, set up, installation, testing and benchmarking tool which does carry out the installation of ROCm suite ranging from dependencies, drivers and toolchain to framework and benchmark. 
RET makes the process of carrying out automated ROCm installation incredibly simple and provides a more user friendly and faster installation experience. 

* Install Linux OS
* Run ret
* Run your Tensorflow benchmark OR Train your own model with tensorflow

## Hardware Support and supported GPU
please refer to ROCm main repository
at [ROCmInstall](https://rocm.github.io/ROCmInstall.html).

# Getting started
## Supported OS
  - Ubuntu: 
      - 16.04
      - 18.04
  - CentOS 7.6   (Tensorflow run on Docker)
  
## Prerequisites
*Note*: it is required to start with a clean system

Formatting a hard drive along with the install of a new OS is the best option
after the instllation you will need git to download the RET source
```
  sudo apt -y install git
  git clone https://github.com/rocmsys/RET.git
```
## Usage
```
sudo ./ret  <command> [<option>]
e.g.
sudo ./ret install rocm or sudo ./ret install tensorflow
```
### Command options
```
Command:
              [install]   <Package>              : Install ROCm or ML Framework TF/PT
              [remove]    <Package>              : Remove ROCm or ML Framework TF/PT
              [benchmark] <Packages> <Model>     : Run benchmark for specific ML Framework
              [build] <Container> <ImageName>    : Build ROCm Container either with Docker or Singularity

   Packages:
              [rocm]                             : ROCm-dkms packages
              [tensorflow]                       : Tensorflow framework

   Model:
              [vgg16]                            : vgg16 model}
              [alexnet]                          : alexnet model
              [resnet50]                         : resnet50 model. Default Model
   Container:
              [docker]                           : Build Docker Container
              [singularity]                      : Build Singularity Container
              [ImageName]                        : Choosing an OS Base Image. Default is [ubuntu:18.04]
    
Options:
              [-py2|-py3]                        : Python version. Default is Python3
              [-h|--help]                        : Show this help message
              [-v|--version]                     : Show version of this package
              [-V|--verbose]                     : Be verbose
              [-d|--debug]                       : Enable Debug Mode
              [-y|--yes]                         : Skip confirmation message
              [-ns|--nsc]                        : Skip system check steps
              [-nv|--nov]                        : Skip verification steps
              [-ic|--incontainer]                : Run RET on top of Container

```
## RUN RET
```
   cd RET
   sudo ./ret install rocm         # install ROCm stack
   sudo reboot
   sudo ./ret install tensorflow   # install Tensorflow
```

### Tensorflow's tf_cnn_benchmarks
Details on the tf_cnn_benchmarks can be found at this [Link](https://github.com/tensorflow/benchmarks/blob/master/scripts/tf_cnn_benchmarks/README.md).  

Here are the basic instructions to run resnet50 benchmark:
```
sudo ./ret benchmark tensorflow resnet50
```
You can also use the TensorFlow benchmarks:
#### Download tensorflow benchmark
```
git clone -b cnn_tf_v1.13_compatible https://github.com/tensorflow/benchmarks.git
cd benchmarks
```
#### Run the training benchmark (e.g. ResNet-50)
```
python3 ./scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --model=resnet50  --batch_size=256 --num_batches=50 --use_fp16=True --datasets_use_prefetch=False --display_every=10
```

**Note:** You may need to add your GPU number ```--num_gpus=YOUR_GPU_NUMBER```

### ToDo Checklist
- [x] Support Ubuntu 16.04
- [x] Support Ubuntu 18.04
- [x] Support CentOS 7.6
- [ ] Support RHEL 7.6
- [x] tensorflow on Ubuntu
- [ ] tensorflow on CentOS
- [ ] tensorflow on RHEL
- [x] pytorch on Ubuntu
- [ ] pytorch on CentOS
- [ ] pytorch on RHEL
- [x] Check System Compatibility
- [ ] Check HW Compatibility
- [x] Adapt RET on top of Docker Container
- [ ] Cloud Support

[![Project Stats](https://www.openhub.net/p/RET-ROCm/widgets/project_thin_badge?format=gif)](https://www.openhub.net/p/RET-ROCm)
