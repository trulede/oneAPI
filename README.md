# oneAPI
Basic oneAPI setup and usage with VS Code and WSL.


## Setup

### WSL

[Configure WSL 2 for GPU Workflows](https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2025-2/configure-wsl-2-for-gpu.html) (Ubuntu 24.04.2 LTS):

> Note: See the Dockerfile for consolidated configuration commands.


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

#### clinfo from WSL

```bash
$ clinfo -l
Platform #0: Intel(R) OpenCL Graphics
 `-- Device #0: Intel(R) Graphics [0x7d51]
```

#### clinfo from Docker

```bash
# WSL Host
$ docker run -it --rm --device=/dev/dxg --volume /usr/lib/wsl:/usr/lib/wsl intel/oneapi-runtime

# In Container
$ apt update; apt install -y clinfo
$ clinfo -l
Platform #0: Intel(R) OpenCL Graphics
 `-- Device #0: Intel(R) Graphics [0x7d51]
Platform #1: Intel(R) OpenCL
 `-- Device #0: Intel(R) Core(TM) Ultra 9 285H
```

#### clinfo from Devcontainer/Workspace prompt

> __Hint:__ See `devcontainer.json` for mount and device configuration.

```bash
$ clinfo -l
Platform #0: Intel(R) OpenCL
 `-- Device #0: Intel(R) Core(TM) Ultra 9 285H
Platform #1: Intel(R) OpenCL Graphics
 `-- Device #0: Intel(R) Graphics [0x7d51]
```
