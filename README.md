# oneAPI
Basic oneAPI setup and usage with VS Code and WSL.


## Setup

### Containers

```
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


### List Devices

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

#### Intel Core Ultra 9 285H

[Intel Core Ultra 9 285H](https://www.intel.com/content/www/us/en/products/sku/241747/intel-core-ultra-9-processor-285h-24m-cache-up-to-5-40-ghz/specifications.html)

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
