#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "caffe" for configuration "RELEASE"
set_property(TARGET caffe APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(caffe PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "proto;proto;/home/rd3/liujiangkan/caffe-static-cpu/release/boost_linux_x86_64/lib/libboost_system.a;/home/rd3/liujiangkan/caffe-static-cpu/release/boost_linux_x86_64/lib/libboost_thread.a;/home/rd3/liujiangkan/caffe-static-cpu/release/boost_linux_x86_64/lib/libboost_filesystem.a;/home/rd3/liujiangkan/caffe-static-cpu/release/boost_linux_x86_64/lib/libboost_regex.a;-lpthread;/home/rd3/liujiangkan/caffe-static-cpu/release/glog_linux_x86_64/lib/libglog.a;gflags_static;/home/rd3/liujiangkan/caffe-static-cpu/release/protobuf_linux_x86_64/lib64/libprotobuf.a;-lpthread;/home/rd3/liujiangkan/caffe-static-cpu/release/hdf5_linux_x86_64/lib/libhdf5_cpp.a;/home/rd3/liujiangkan/caffe-static-cpu/release/hdf5_linux_x86_64/lib/libhdf5.a;/home/rd3/liujiangkan/caffe-static-cpu/release/hdf5_linux_x86_64/lib/libhdf5_hl_cpp.a;/home/rd3/liujiangkan/caffe-static-cpu/release/hdf5_linux_x86_64/lib/libhdf5_hl.a;/home/rd3/liujiangkan/caffe-static-cpu/release/hdf5_linux_x86_64/lib/libhdf5_cpp.a;/home/rd3/liujiangkan/caffe-static-cpu/release/hdf5_linux_x86_64/lib/libhdf5.a;/home/rd3/liujiangkan/caffe-static-cpu/release/lmdb_linux_x86_64/usr/local/lib/liblmdb.a;/home/rd3/liujiangkan/caffe-static-cpu/release/leveldb_linux_x86_64/lib/libleveldb.a;/home/rd3/liujiangkan/caffe-static-cpu/release/snappy_linux_x86_64/lib64/libsnappy.a;opencv_core;opencv_highgui;opencv_imgproc;/home/rd3/liujiangkan/caffe-static-cpu/release/OpenBLAS_linux_x86_64/lib/libopenblas.a;dl;-pthread;-lrt"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libcaffe.so.1.0.0-rc3"
  IMPORTED_SONAME_RELEASE "libcaffe.so.1.0.0-rc3"
  )

list(APPEND _IMPORT_CHECK_TARGETS caffe )
list(APPEND _IMPORT_CHECK_FILES_FOR_caffe "${_IMPORT_PREFIX}/lib/libcaffe.so.1.0.0-rc3" )

# Import target "proto" for configuration "RELEASE"
set_property(TARGET proto APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(proto PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libproto.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS proto )
list(APPEND _IMPORT_CHECK_FILES_FOR_proto "${_IMPORT_PREFIX}/lib/libproto.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
