FROM intel/oneapi-basekit

RUN apt-get install -y gpg-agent wget; \
    echo 'deb [arch=amd64,i386 signed-by=/usr/share/keyrings/intel-graphics.gpg] https://repositories.intel.com/graphics/ubuntu jammy arc' | tee  /etc/apt/sources.list.d/intel.gpu.jammy.list
RUN apt update; \
    apt-get install -y \
        intel-opencl-icd \
        intel-level-zero-gpu \
        level-zero \
        intel-media-va-driver-non-free \
        libmfx1 \
        libmfxgen1 \
        libvpl2 \
        libegl-mesa0 \
        libegl1-mesa \
        libegl1-mesa-dev \
        libgbm1 \
        libgl1-mesa-dev \
        libgl1-mesa-dri \
        libglapi-mesa \
        libgles2-mesa-dev \
        libglx-mesa0 \
        libigdgmm12 \
        libxatracker2 \
        mesa-va-drivers \
        mesa-vdpau-drivers \
        mesa-vulkan-drivers \
        va-driver-all \
    && \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*
RUN apt update; \
    apt-get install -y \
        libigc-dev \
        intel-igc-cm \
        libigdfcl-dev \
        libigfxcmrt-dev \
        level-zero-dev \
        clinfo \
    && \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*
