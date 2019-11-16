![AMDh_mb_8bit](media/41501009b8bbe5f58f5bd3154861af00.png)

| AMD ROCm Deployment User Guide                           |                |               |           |     |   |   |   |   |
|----------------------------------------------------------|----------------|---------------|-----------|-----|---|---|---|---|
|                                                          | Publication \# | 1.0           | Revision: | 4.0 |   |   |   |   |
|                                                          | Issue Date:    | November 2019 |           |     |   |   |   |   |
|                                                          |                |               |           |     |   |   |   |   |
| © 2019 Advanced Micro Devices, Inc. All rights reserved. |                |               |           |     |   |   |   |   |

![A close up of a newspaper Description automatically generated](media/7967492a3c9a895559b99b77f8b17b90.png)

Table of Contents

[Revision History 4](#_Toc24642645)

[Chapter 1 Introduction 6](#introduction)

[Chapter 2 ROCm Setup and Installation 6](#rocm-setup-and-installation)

[2.1 System Requirements 6](#system-requirements)

[2.2 Installing ROCm 7](#installing-rocm)

[2.3 Installing the Applications 7](#installing-the-applications)

[2.4 Running the Machine Learning Application
8](#running-the-machine-learning-application)

[2.4.1 Tensorflow 8](#tensorflow)

[2.4.2 PyTorch 9](#pytorch)

[2.5 Running HPC Application 10](#running-hpc-application)

[2.5.1 NAMD 10](#namd)

[2.6 Known System Issues 10](#known-system-issues)

Revision History

| Date          | Revision | Description                                  |
|---------------|----------|----------------------------------------------|
| October 2019  | 1.0      | Initial preliminary release                  |
| October 2019  | 2.0      | Added Known System Issues                    |
| October 2019  | 3.0      | Added Benchmark for Tensorflow and PyTorch   |
| November 2019 | 4.0      | Removed Benchmark for Tensorflow and PyTorch |

Introduction
============

This guide covers the basic instructions needed to install the ROCm software
suite of applications using the command line interface and verify that these
Machine Learning (ML) and High-Performance Computing (HPC) applications can run
on supported frameworks.

The instructions are intended to be used on a clean installation of a supported
application. The document also discusses the scale-out of the High Performing
Computing (HPC) and Machine Learning (ML) applications on the AMD platform.

ROCm Setup and Installation
===========================

System Requirements
-------------------

To use the Machine Learning and High-Performance Computing applications on your
system, you will need the following hardware and software installed:

Software Requirements

| Supported Operating Systems |
|-----------------------------|
| Ubuntu v18.04               |

-   CentOS v7.6

-   REHL 7.6

**Note**: You must install and verify the supported operating system before
installing ROCm.

**Hardware Requirements**

You must ensure you can view the VGA/3D controllers to determine if the cards
are detected prior to the installation of the ROCm framework.

To detect the cards, from the command line, enter:

| sudo lshw -c video |
|--------------------|


You will see the output for each PCle device. The vendor in the output must
display as *"Advanced Micro Devices, Inc."*

For example, see the code sample below:

| \*-display description: Display controller product: Vega 20 vendor: **Advanced Micro Devices, Inc. [AMD/ATI]** physical id: 0 bus info: [pci\@0000:03:00.0](pci@0000:03:00.0) version: 02 width: 64 bits clock: 33MHz capabilities: pm pciexpress msi bus_master cap_list rom configuration: driver=amdgpu latency=0 |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


Installing ROCm
---------------

To install the ROCm application, run RET with the install command:

| sudo apt -y install git cd \~/ wget <https://github.com/rocmsys/RET.git> cd RET sudo ./ret install rocm \#see all options sudo ./ret -h |
|-----------------------------------------------------------------------------------------------------------------------------------------|


For more details, refer <https://rocm.github.io/ROCmInstall.html>

Installing the Applications
---------------------------

To install the Tensorflow, PyTorch, NAMD and other applications, enter

| cd \~/RET sudo ./ret install \<my application\> \#For example, sudo ./ret install tensorflow sudo ./ret install pytorch sudo ./ret install namd |
|-------------------------------------------------------------------------------------------------------------------------------------------------|


Running the Machine Learning Application
----------------------------------------

You can run the applications using Tensorflow and PyTorch for Machine Learning.

### Tensorflow

#### Training a Machine Learning Model Using Tensorflow 

To train a machine learning model using Tensorflow, use the example below:

1.  Clone the Tensorflow test model.

| git clone <https://github.com/tensorflow/models> |
|--------------------------------------------------|


2.  Download the CIFAR-10 dataset using:

| pip3 install tensorflow_datasets cd models/tutorials/image/cifar10_estimator python3 generate_cifar10_tfrecords.py --data-dir=\${PWD}/cifar-10-data |
|-----------------------------------------------------------------------------------------------------------------------------------------------------|


3.  To run on a single node (single GPU), enter

| TF_ROCM_FUSION_ENABLE=1 python3 cifar10_main.py \\ --data-dir=\${PWD}/cifar-10-data \\ --job-dir=/tmp/cifar10 \\ --num-gpus=1 \\ --train-steps=100 |
|----------------------------------------------------------------------------------------------------------------------------------------------------|


4.  To run on a single node (multi GPUs (data parallelism)), enter

| TF_ROCM_FUSION_ENABLE=1 python3 cifar10_main.py \\ --data-dir=\${PWD}/cifar-10-data \\ --job-dir=/tmp/cifar10 \\ --num-gpus=2 \\ --train-steps=100 |
|----------------------------------------------------------------------------------------------------------------------------------------------------|


5.  To run on multi nodes

TBD

### PyTorch

#### Training a Machine Learning Model Using PyTorch

To train a machine learning model using PyTorch, use the example below:

1.  Download the script *wget*

| mkdir pytorch cd pytorch wget <https://raw.githubusercontent.com/wiki/ROCmSoftwarePlatform/pytorch/micro_benchmarking_pytorch.py> wget <https://raw.githubusercontent.com/wiki/ROCmSoftwarePlatform/pytorch/fp16util.py> wget <https://raw.githubusercontent.com/wiki/ROCmSoftwarePlatform/pytorch/shufflenet.py> wget <https://raw.githubusercontent.com/wiki/ROCmSoftwarePlatform/pytorch/shufflenet_v2.py> |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


2.  To run on a single node (single GPU), enter

| python3 micro_benchmarking_pytorch.py \\ --network resnet50 \\ --batch-size 128 \\ --fp16 1 |
|---------------------------------------------------------------------------------------------|


3.  To run on a single node (multi GPU (Data Parallelism)), enter

| python3 micro_benchmarking_pytorch.py \\ --network resnet50 \\ --batch-size 128 \\ --fp16 1 \\ --dataparallel \\ --device_ids 0,1 |
|-----------------------------------------------------------------------------------------------------------------------------------|


Running HPC Application
-----------------------

### NAMD

After the installation:

| cd ../namd ./namd2 src/alanin -d |
|----------------------------------|


Known System Issues
-------------------

The following table consists of the known system issues and the recommended
resolutions in this release:

| **Known Issue**                                                                                                                                                                                                  | **Resolution**                                                                       |   |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|---|
| Error loading shared library libopenblas.so.3: No such file or directory \>ImportError: libopenblas.so.0: cannot open shared object file: No such file or directory                                              | Run the following command to resolve this error:                                     |   |
| sudo apt-get install libopenblas-base export LD_LIBRARY_PATH=/usr/lib/openblas-base/                                                                                                                             |                                                                                      |   |
| Error loading module ‘torchvision’. The torchvision module consists of popular datasets, model architectures, and common image transformations for computer vision. \>ImportError: No module named 'torchvision' | To resolve this error, use the following command to install the ‘torchvision’ module |   |
| pip3 install torchvision                                                                                                                                                                                         |                                                                                      |   |
| The error message indicates a problem with the locale setting. \>Error: unsupported locale setting                                                                                                               | Modify the locale to fix the problem.                                                |   |
| export LC_ALL=C                                                                                                                                                                                                  |                                                                                      |   |
