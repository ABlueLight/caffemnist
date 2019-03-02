# Config file for the Caffe package.
#
# Note:
#   Caffe and this config file depends on opencv,
#   so put `find_package(OpenCV)` before searching Caffe
#   via `find_package(Caffe)`. All other lib/includes
#   dependencies are hard coded in the file
#
# After successful configuration the following variables
# will be defined:
#
#   Caffe_INCLUDE_DIRS - Caffe include directories
#   Caffe_LIBRARIES    - libraries to link against
#   Caffe_DEFINITIONS  - a list of definitions to pass to compiler
#
#   Caffe_HAVE_CUDA    - signals about CUDA support
#   Caffe_HAVE_CUDNN   - signals about cuDNN support


# OpenCV dependency (optional)

if(on)
  if(NOT OpenCV_FOUND)
    set(Caffe_OpenCV_CONFIG_PATH "/home/rd3/liujiangkan/caffe-static-cpu/release/opencv_linux_x86_64/share/OpenCV")
    if(Caffe_OpenCV_CONFIG_PATH)
      get_filename_component(Caffe_OpenCV_CONFIG_PATH ${Caffe_OpenCV_CONFIG_PATH} ABSOLUTE)

      if(EXISTS ${Caffe_OpenCV_CONFIG_PATH} AND NOT TARGET opencv_core)
        message(STATUS "Caffe: using OpenCV config from ${Caffe_OpenCV_CONFIG_PATH}")
        include(${Caffe_OpenCV_CONFIG_PATH}/OpenCVModules.cmake)
      endif()

    else()
      find_package(OpenCV REQUIRED)
    endif()
    unset(Caffe_OpenCV_CONFIG_PATH)
  endif()
endif()

# Compute paths
get_filename_component(Caffe_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
set(Caffe_INCLUDE_DIRS "/home/rd3/liujiangkan/caffe-static-cpu/release/boost_linux_x86_64/include;/home/rd3/liujiangkan/caffe-static-cpu/release/glog_linux_x86_64/include;/home/rd3/liujiangkan/caffe-static-cpu/release/gflags_linux_x86_64/include;/home/rd3/liujiangkan/caffe-static-cpu/release/protobuf_linux_x86_64/include;/home/rd3/liujiangkan/caffe-static-cpu/release/hdf5_linux_x86_64/include;/home/rd3/liujiangkan/caffe-static-cpu/release/lmdb_linux_x86_64/usr/local/include;/home/rd3/liujiangkan/caffe-static-cpu/release/leveldb_linux_x86_64/include;/home/rd3/liujiangkan/caffe-static-cpu/release/snappy_linux_x86_64/include;/home/rd3/liujiangkan/caffe-static-cpu/release/opencv_linux_x86_64/include/opencv;/home/rd3/liujiangkan/caffe-static-cpu/release/opencv_linux_x86_64/include;/home/rd3/liujiangkan/caffe-static-cpu/release/OpenBLAS_linux_x86_64/include")

get_filename_component(__caffe_include "${Caffe_CMAKE_DIR}/../../include" ABSOLUTE)
list(APPEND Caffe_INCLUDE_DIRS ${__caffe_include})
unset(__caffe_include)


# Our library dependencies
if(NOT TARGET caffe AND NOT caffe_BINARY_DIR)
  include("${Caffe_CMAKE_DIR}/CaffeTargets.cmake")
endif()

# List of IMPORTED libs created by CaffeTargets.cmake
set(Caffe_LIBRARIES caffe)

# Definitions
set(Caffe_DEFINITIONS "-DCPU_ONLY;-DUSE_OPENCV;-DUSE_LMDB;-DUSE_LEVELDB")

# Cuda support variables
set(Caffe_CPU_ONLY ON)
set(Caffe_HAVE_CUDA FALSE)
set(Caffe_HAVE_CUDNN FALSE)
