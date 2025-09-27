# oneAPI
Basic oneAPI setup and usage with VS Code and WSL.


## Setup

### WSL

[Configure WSL 2 for GPU Workflows](https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2025-2/configure-wsl-2-for-gpu.html) (Ubuntu 24.04.2 LTS):

```bash
$ apt-get install -y gpg-agent wget
$ echo 'deb [arch=amd64,i386 signed-by=/usr/share/keyrings/intel-graphics.gpg] https://repositories.intel.com/graphics/ubuntu jammy arc' |   sudo tee  /etc/apt/sources.list.d/intel.gpu.jammy.list
$ sudo apt-get install -y   intel-opencl-icd intel-level-zero-gpu level-zero   intel-media-va-driver-non-free libmfx1 libmfxgen1 libvpl2   libegl-mesa0 libegl1-mesa libegl1-mesa-dev libgbm1 libgl1-mesa-dev libgl1-mesa-dri   libglapi-mesa libgles2-mesa-dev libglx-mesa0 libigdgmm12 libxatracker2 mesa-va-drivers   mesa-vdpau-drivers mesa-vulkan-drivers va-driver-all
$ sudo apt update
$ sudo apt-get install -y   libigc-dev   intel-igc-cm   libigdfcl-dev   libigfxcmrt-dev   level-zero-dev
$ sudo apt-get install clinfo
$ clinfo
```

### Containers

```bash
$ docker image ls
REPOSITORY             TAG       IMAGE ID       CREATED       SIZE
intel/oneapi-basekit   latest    20e7c127915c   4 weeks ago   12.6GB
intel/cpp-essentials   latest    9e67453499fa   4 weeks ago   6.85GB
```


### VS Code Extensions

* WSL
* Dev Containers


### Open in Container

1. Open the Command Palette (Ctrl-Shift-P) and run Dev Containers: Open in Container
2. Select the repo folder
3. Select the existing Dockerfile in the root of the repo.  
   (VSCode now opens running in the Dev Container/Docker file, container is runnning in WSL)

The Dev Container config (.devcontainer/devcontainer.json) can be edited as required.

4. To reopen the container, open the Command Palette (Ctrl-Shift-P) and run Dev Containers: Reopen in Container


## Run Examples

### Simple Add

```bash
$ . /opt/intel/oneapi/setvars.sh
$ cd examples/simple-add/

# Configure.
$ mkdir build
$ cd build
$ cmake .. -DUSM=1

# Build
$ make cpu-gpu
$ make cpu-gpu VERBOSE=1
$ make clean

# Run
$ ./simple-add-usm 
Running on device: Intel(R) Core(TM) Ultra 9 285H
Array size: 10000
[0]: 0 + 100000 = 100000
[1]: 1 + 100000 = 100001
[2]: 2 + 100000 = 100002
...
[9999]: 9999 + 100000 = 109999
Successfully completed on device. 
```


## System Setup

### Intel Core Ultra 9 285H

<details>
<summary>Intel Core Ultra 9 285H</summary>

[Intel Core Ultra 9 285H Spec Sheet](https://www.intel.com/content/www/us/en/products/sku/241747/intel-core-ultra-9-processor-285h-24m-cache-up-to-5-40-ghz/specifications.html)

* Overall Peak TOPS (Int8) 99
* Total Cores 16
   * Performance-cores 6
   * Efficient-cores 8
   * Low Power Efficient-cores 2
* Total Threads 16
* Performance-core Max Turbo Frequency 5.4 GHz
* Efficient-core Max Turbo Frequency 4.5 GHz
* Low Power Efficient-core Max Turbo Frequency 2.5 GHz
* Performance-core Base Frequency 2.9 GHz
* Efficient-core Base Frequency 2.7 GHz
* Low Power Efficient-core Base Frequency 1 GHz
* Intel® Deep Learning Boost (Intel® DL Boost) on CPU Yes
* AI Software Frameworks Supported by CPU: OpenVINO™, WindowsML, ONNX RT, DirectML, WebNN
* GPU Name: Intel® Arc™ 140T GPU
   * Graphics Max Dynamic Frequency 2.35 GHz
   * GPU Peak TOPS (Int8) 77
   * Xe-cores 8
   * DirectX* Support 12.2
   * OpenGL* Support 4.6
   * OpenCL* Support 3.0
   * Multi-Format Codec Engines 2
   * H.264 Hardware Encode/Decode Yes
   * H.265 (HEVC) Hardware Encode/Decode Yes
   * Device ID 0x7D51
   * Intel® Deep Learning Boost (Intel® DL Boost) on GPU Yes
   * AI Software Frameworks Supported by GPU: OpenVINO™: WindowsML, DirectML, ONNX RT, WebGPU
* NPU Name‡ Intel® AI Boost
   * NPU Peak TOPS (Int8) 13
   * Sparsity Support Yes
   * Windows Studio Effects Support Yes
   * AI Software Frameworks Supported by NPU: OpenVINO™, WindowsML, DirectML, ONNX RT, WebNN
</details>


### clinfo

<details>
<summary>clinfo (from WSL prompt)</summary>

```bash
$ clinfo
Number of platforms                               1
  Platform Name                                   Intel(R) OpenCL Graphics
  Platform Vendor                                 Intel(R) Corporation
  Platform Version                                OpenCL 3.0
  Platform Profile                                FULL_PROFILE
....
  Platform Numeric Version                        0xc00000 (3.0.0)
  Platform Extensions function suffix             INTEL
  Platform Host timer resolution                  1ns
  Platform External memory handle types           DMA buffer

  Platform Name                                   Intel(R) OpenCL Graphics
Number of devices                                 1
  Device Name                                     Intel(R) Graphics [0x7d51]
  Device Vendor                                   Intel(R) Corporation
  Device Vendor ID                                0x8086
  Device Version                                  OpenCL 3.0 NEO
  Device UUID                                     8680517d-0300-0000-0002-000000000000
  Driver UUID                                     32332e34-332e-3032-3736-343200000000
  Valid Device LUID                               No
  Device LUID                                     900b-b880fc7f0000
  Device Node Mask                                0
  Device Numeric Version                          0xc00000 (3.0.0)
  Driver Version                                  23.43.027642
  Device OpenCL C Version                         OpenCL C 1.2
  Device OpenCL C all versions                    OpenCL C                                                         0x400000 (1.0.0)
                                                  OpenCL C                                                         0x401000 (1.1.0)
                                                  OpenCL C                                                         0x402000 (1.2.0)
                                                  OpenCL C                                                         0xc00000 (3.0.0)
  Device OpenCL C features                        __opencl_c_int64                                                 0xc00000 (3.0.0)
....
  Latest conformance test passed                  v2023-05-16-00
  Device Type                                     GPU
  Device PCI bus info (KHR)                       PCI-E, 0000:00:02.0
  Device Profile                                  FULL_PROFILE
  Device Available                                Yes
  Compiler Available                              Yes
  Linker Available                                Yes
  Max compute units                               128
  Max clock frequency                             2350MHz
  Device IP (Intel)                               0x3128004 (12.296.4)
  Device ID (Intel)                               32081
  Slices (Intel)                                  2
  Sub-slices per slice (Intel)                    8
  EUs per sub-slice (Intel)                       8
  Threads per EU (Intel)                          8
  Feature capabilities (Intel)                    DP4A
  Device Partition                                (core)
    Max number of sub-devices                     0
    Supported partition types                     None
    Supported affinity domains                    (n/a)
  Max work item dimensions                        3
  Max work item sizes                             1024x1024x1024
  Max work group size                             1024
  Preferred work group size multiple (device)     64
....
NULL platform behavior
  clGetPlatformInfo(NULL, CL_PLATFORM_NAME, ...)  Intel(R) OpenCL Graphics
  clGetDeviceIDs(NULL, CL_DEVICE_TYPE_ALL, ...)   Success [INTEL]
  clCreateContext(NULL, ...) [default]            Success [INTEL]
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_DEFAULT)  Success (1)
    Platform Name                                 Intel(R) OpenCL Graphics
    Device Name                                   Intel(R) Graphics [0x7d51]
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_CPU)  No devices found in platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_GPU)  Success (1)
    Platform Name                                 Intel(R) OpenCL Graphics
    Device Name                                   Intel(R) Graphics [0x7d51]
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_ACCELERATOR)  No devices found in platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_CUSTOM)  No devices found in platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_ALL)  Success (1)
    Platform Name                                 Intel(R) OpenCL Graphics
    Device Name                                   Intel(R) Graphics [0x7d51]

ICD loader properties
  ICD loader Name                                 OpenCL ICD Loader
  ICD loader Vendor                               OCL Icd free software
  ICD loader Version                              2.3.2
  ICD loader Profile                              OpenCL 3.0
```

<details>

### sycl-ls

<details>
<summary>sycl-ls --verbose (in Docker container)</summary>

```bash
$ sycl-ls --verbose
[opencl:cpu][opencl:0] Intel(R) OpenCL, Intel(R) Core(TM) Ultra 9 285H OpenCL 3.0 (Build 0) [2025.20.8.0.06_160000]

Platforms: 1
Platform [#1]:
    Version  : OpenCL 3.0 LINUX
    Name     : Intel(R) OpenCL
    Vendor   : Intel(R) Corporation
    Devices  : 1
        Device [#0]:
        Type              : cpu
        Version           : OpenCL 3.0 (Build 0)
        Name              : Intel(R) Core(TM) Ultra 9 285H
        Vendor            : Intel(R) Corporation
        Driver            : 2025.20.8.0.06_160000
        UUID              : ...
        DeviceID          : 788050
        Num SubDevices    : 0
        Num SubSubDevices : 0
        Aspects           : cpu fp16 fp64 online_compiler online_linker queue_profiling usm_device_allocations usm_host_allocations usm_shared_allocations usm_system_allocations ext_intel_gpu_slices ext_intel_gpu_subslices_per_slice ext_intel_gpu_eu_count_per_subslice usm_atomic_host_allocations usm_atomic_shared_allocations atomic64 ext_intel_device_info_uuid ext_oneapi_srgb ext_oneapi_native_assert ext_intel_gpu_hw_threads_per_eu ext_oneapi_cuda_async_barrier ext_intel_device_id ext_intel_legacy_image ext_oneapi_ballot_group ext_oneapi_fixed_size_group ext_oneapi_opportunistic_group ext_oneapi_tangle_group ext_oneapi_limited_graph ext_oneapi_private_alloca ext_oneapi_atomic16 ext_oneapi_virtual_functions
        info::device::sub_group_sizes: 4 8 16 32 64
        Architecture: x86_64
default_selector()      : cpu, Intel(R) OpenCL, Intel(R) Core(TM) Ultra 9 285H OpenCL 3.0 (Build 0) [2025.20.8.0.06_160000]
accelerator_selector()  : No device of requested type available. Please chec...
cpu_selector()          : cpu, Intel(R) OpenCL, Intel(R) Core(TM) Ultra 9 285H OpenCL 3.0 (Build 0) [2025.20.8.0.06_160000]
gpu_selector()          : No device of requested type available. Please chec...
custom_selector(gpu)    : No device of requested type available. Please chec...
custom_selector(cpu)    : cpu, Intel(R) OpenCL, Intel(R) Core(TM) Ultra 9 285H OpenCL 3.0 (Build 0) [2025.20.8.0.06_160000]
custom_selector(acc)    : No device of requested type available. Please chec...
```

</details>
