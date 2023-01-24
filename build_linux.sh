#! /bin/bash

clear

export LD_LIBRARY_PATH="${CONDA_PREFIX}/lib"
export RMW_IMPLEMENTATION="rmw_wasm_cpp"

VERBOSE=1 colcon --log-level debug build \
    $@ \
    --symlink-install \
    --packages-skip-build-finished \
    --merge-install \
    --cmake-args \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=ON \
        -DPYTHON_LIBRARY=$(python -c "import distutils.sysconfig as sysconfig; print(sysconfig.get_config_var('LIBDIR'))") \
        -DPYTHON_INCLUDE_DIR=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")  



    # --event-handlers console_direct+ 

# NOTE: must build ros2cli, ros2run for ros2 commands