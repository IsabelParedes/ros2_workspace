# BUILD

From root dir
```sh
rosdep install -i --from-path src --rosdistro humble -y

colcon build 
```

### Setup

```sh
. install/local_setup.bash

# OR (to source underlay it was created in)
. install/setup.bash
```

### ENV VARS

```sh
export RMW_IMPLEMENTATION=rmw_wasm_cpp
```


Shared libs cannot be found:
```sh
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib
```

Debugging
```
clear; colcon --log-level debug build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo --packages-select rmw_wasm_cpp


clear; RMW_IMPLEMENTATION=rmw_wasm_cpp ros2 run pubsub_test talker --ros-args --log-level debug
```