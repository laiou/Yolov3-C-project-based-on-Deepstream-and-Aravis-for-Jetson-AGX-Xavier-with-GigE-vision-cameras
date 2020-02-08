Yolov3 C/C++ project based on Deepstream and Aravis for Jetson AGX Xavier with GigE vision cameras 

--------------------------------------------------------------------------------
Pre-requisites:

- Install the driver "pylon_5.2.0.13457-deb0_arm64.deb" for the GigE vision camera (i.e. Basler acA 1920-40gc)  

  The IP address of Jetson AGX Xavier shoud be set as 219.216.101.5.

- Install Aravis https://github.com/AravisProject/aravis

  sudo apt-get install libnotify-dev
  
  sudo apt-get install libaudit-dev

  ./configure
   
   make
   
   make install

   Set an environment variable on a Linux
   
   gedit ~/.bashrc
   
   export GST_PLUGIN_PATH=/usr/local/lib/gstreamer-1.0

   arv-viewer

   arv-tool-0.6 --name="Basler-acA1920-40gc-22430757" control PixelFormat

- Install Gstreamer

  sudo apt-get Yolov3install libgstreamer*

  sudo apt-get install gstreamer1.0-tools gstreamer1.0-alsa gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav

--------------------------------------------------------------------------------
Compile the custom library:

  $ export CUDA_VER=10.0
  
  $ make -C nvdsinfer_custom_impl_Yolo

--------------------------------------------------------------------------------
Run deepstream_yolov3_aravis :

  Set the power mode of Jetson AGX Xavier as 0 (i.e., MAXN).

  $ make
  
  $ sudo ./deepstream_yolov3_aravis

  which is equivalent to the following command:

gst-launch-1.0 aravissrc ! 'video/x-bayer, width=(int)1920, height=(int)1080, framerate=(fraction)40/1' ! bayer2rgb ! videoconvert ! "video/x-raw, format=(string)RGBA" ! nvvideoconvert ! capsfilter caps="video/x-raw(memory:NVMM),width=1920,height=1080,framerate=40/1,format=(string)RGBA" ! nv.sink_01 nvstreammux name=nv width=1920 height=1080 batch-size=1 batched-push-timeout=4000000 live-source=true ! nvinfer config-file-path=config_infer_primary_yoloV3.txt ! nvdsosd ! nvegltransform ! nveglglessink

  Note 1：For the details on Gstreamer plugins，please use the command "gst-inspect-1.0 xxx", e.g.

        gst-inspect-1.0 nvvidconv
        
  Note 2: video/x-raw is CPU buffer. video/x-raw(memory:NVMM) is DMA buffer.

  Note 3: With the aid of UDP, the process "deepstream_yolov3_aravis" can send object detection results to the process "server".
  
  Note 4:     
         
                    - Server/Server.cpp - Realization of a UDP server
                    
                    - config_infer_primary_yoloV3.txt - Configuration file for the GStreamer nvinfer plugin for the Yolo detector model.
                    
                       The "nvinfer" config file config_infer_primary_yoloV3.txt specifies the path to the custom library and the custom output 
                       parsing function through the properties "custom-lib-path" and "parse-bbox-func-name" respectively.

                   - The first-time a "model_b1_int8.engine" would be generated as the engine-file.

                   - yolov3-calibration.table.trt5.1 - yoloV3 INT8 calibration binary on TensorRT 5.1+

                    - nvdsinfer_custom_impl_Yolo/nvdsinfer_yolo_engine.cpp -  Implementation of 'NvDsInferCudaEngineGet' for nvdsinfer 
                       to create cuda engine.

                   - nvdsinfer_custom_impl_Yolo/nvdsparsebbox_Yolo.cpp - Output layer  parsing function for detected objects for the Yolo model.
                    
                   - nvdsinfer_custom_impl_Yolo/yoloPlugins.h -  Declaration of YoloLayerV3 and YoloLayerV3PluginCreator.
                   
                   - nvdsinfer_custom_impl_Yolo/yoloPlugins.cpp -  Implementation of YoloLayerV3 and YoloLayerV3PluginCreator.

                   - nvdsinfer_custom_impl_Yolo/kernels.cu - Implementation of cuda kernels 
                   
                   - nvdsinfer_custom_impl_Yolo/trt_utils.h - Utilities to setup tensorRT networks
                   
                   - nvdsinfer_custom_impl_Yolo/trt_utils.cpp - Implementation of Utilities to setup  tensorRT networks
                   
                     - nvdsinfer_custom_impl_Yolo/yolo.h - Interface to create Yolo Cuda-Engine
                     
                     - nvdsinfer_custom_impl_Yolo/yolo.cpp - Implementation to create Yolo Cuda-Engine
