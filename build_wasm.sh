#! /bin/bash

clear

export EMSDK_VERBOSE=1

export WORKSPACE="/home/ihuicatl/Robots/repos/MasterThesis/Middleware/workspace_underlay"
export ENV_PATH="/home/ihuicatl/Robots/miniconda3/envs/underlay"
export EMSDK_DIR="/home/ihuicatl/Robots/repos/MasterThesis/emsdk"
export LD_LIBRARY_PATH="${CONDA_PREFIX}/lib"

export RMW_IMPLEMENTATION="rmw_wasm_cpp"
# export AMENT_PREFIX_PATH="${WORKSPACE}/install"
export COLCON_PREFIX_PATH="${WORKSPACE}/install"

export USER_DEFS=" -pthread"

VERBOSE=1 colcon build \
    $@ \
    --packages-skip-build-finished \
    --event-handlers console_direct+ \
    --merge-install \
    --cmake-args \
        -DCMAKE_TOOLCHAIN_FILE="${EMSDK_DIR}/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake" \
        -DBUILD_TESTING=OFF \
        -DBUILD_SHARED_LIBS=OFF \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DRMW_IMPLEMENTATION="rmw_wasm_cpp" \
        -DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=ON \
        -DPYTHON_INCLUDE_DIR=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")  \
        -DPYTHON_LIBRARY=$(python -c "import distutils.sysconfig as sysconfig; print(sysconfig.get_config_var('LIBDIR'))") \
        # -DCMAKE_BUILD_TYPE=Debug \
        


    # --event-handlers console_direct+ \

        # -DCMAKE_CXX_FLAGS="${CXXFLAGS} -s USE_PTHREADS=1" \
        # -DCMAKE_EXE_LINKER_FLAGS="-s ASYNCIFY -s PROXY_TO_PTHREAD" \

    # --packages-select rosidl_typesupport_cpp builtin_interfaces \
    # --packages-ignore \
    #     fastrtps \
    #     rosidl_typesupport_fastrtps_c \
    #     rosidl_typesupport_fastrtps_cpp \
    #     rosidl_typesupport_introspection_cpp \
    #     fastrtps_cmake_module \
    #     rosidl_generator_dds_idl \
    #     rmw_fastrtps_cpp \
    #     rmw_fastrtps_dynamic_cpp \
    #     rmw_fastrtps_shared_cpp \
    #     rmw_dds_common \
    # --install-base="./underlay2_install" \

    # --packages-ignore \
        # mimick_vendor \
        # performance_test_fixture \
        # fastrtps \
        # rmw_fastrtps_cpp \
        # rmw_fastrtps_dynamic_cpp \
        # rmw_fastrtps_shared_cpp \
        # qt_gui_cpp \
        # rosidl_generator_py \
        # -DCMAKE_STAGING_PREFIX="/home/ihuicatl/Robots/repos/MasterThesis/emsdk/upstream/emscripten/cache/sysroot" \
