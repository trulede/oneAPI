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