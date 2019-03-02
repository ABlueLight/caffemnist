#define CPU_ONLY
#include <fstream>
#include <algorithm>
#include <iosfwd>
#include <memory>
#include <string>
#include <utility>
#include <vector>
#include <iostream>
#include "caffe/caffe.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"

int main()
{
	caffe::Caffe::set_mode(caffe::Caffe::CPU);
	
	caffe::Net<float> *caffe_net_test = nullptr;
	
	caffe_net_test = new caffe::Net<float>("../models/lenet.prototxt", caffe::TEST);

	caffe::NetParameter trained_net_param_test;

	if (!caffe::ReadProtoFromBinaryFile("../models/lenet_iter_10000.caffemodel", &trained_net_param_test)) {
  		std::cout<<"read trained file failed"<<std::endl;  
		return -1;
  	}
	
	caffe_net_test->CopyTrainedLayersFrom(trained_net_param_test);

	caffe::Blob<float>* input = caffe_net_test->blobs().at(0).get();

	int rwidth = input->width();
 	int rheight = input->height();
 	int rchannels = input->channels();
	
	std::cout<<"rwidth = "<<rwidth<<std::endl;
	std::cout<<"rheight = "<<rheight<<std::endl;
	std::cout<<"rchannels = "<<rchannels<<std::endl;
	

	cv::Mat src_img = cv::imread("../raw/mnist_train_0.jpg",cv::IMREAD_GRAYSCALE);

	std::cout<<"read file finish"<<std::endl;
	  float* transformed_data = input->mutable_cpu_data();
	  int top_index;

	std::cout<<"begin transfor"<<std::endl;

  for (int h = 0; h < rheight; ++h) {
      const uchar* ptr = src_img.ptr<uchar>(h);
      int img_index = 0;
      for (int w = 0; w < rwidth; ++w) {
          for (int c = 0; c < rchannels; ++c) {
              top_index = (c * rheight + h) * rwidth + w;
              float pixel;
              pixel = (static_cast<float>(ptr[img_index++]) - 0);
              transformed_data[top_index] = pixel;
          }
      }
  }
	std::cout<<"transform finish"<<std::endl;	
	caffe_net_test->Forward();
	std::cout<<"forward finish "<<std::endl;	
	
	float prob_0 = caffe_net_test->blob_by_name("prob")->data_at(0,3,0,0);
	std::cout<<"prob0 = "<<prob_0<<std::endl;

	if(caffe_net_test != nullptr){
	//	delete caffe_net_test;
	//	caffe_net_test = nullptr;
	}

	return 0;
}
