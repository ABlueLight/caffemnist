cmake_minimum_required(VERSION 3.0)
project(TestCaffe)

include_directories(./3rdparty/caffe-cpu-Linux-x86_64/include)
include_directories(./3rdparty/opencv-cpu-Linux-x86_64/include)
set(LIBS caffe opencv_core opencv_imgcodecs opencv_highgui opencv_imgproc)
link_directories(${PROJECT_SOURCE_DIR}/3rdparty/opencv-cpu-Linux-x86_64/lib)
link_directories(${PROJECT_SOURCE_DIR}/3rdparty/caffe-cpu-Linux-x86_64/lib)
link_libraries(${LIBS})
set(CMAKE_CXX_FLAGS "-D_GLIBCXX_USE_CXX11_ABI=0")
add_executable(CaffeMnist main.cpp)
set_target_properties(CaffeMnist PROPERTIES 
       		LINK_FLAGS "-Wl,-rpath=${PROJECT_SOURCE_DIR}/3rdparty/opencv-cpu-Linux-x86_64/lib")
