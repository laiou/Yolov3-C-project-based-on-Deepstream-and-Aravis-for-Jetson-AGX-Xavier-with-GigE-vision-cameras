TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
    ../nvdsinfer_yolo_engine.cpp \
    ../nvdsparsebbox_Yolo.cpp \
    ../trt_utils.cpp \
    ../yolo.cpp \
    ../yoloPlugins.cpp

DISTFILES += \
    ../kernels.cu \
    ../Makefile \
    ../README \
    ../config_infer_primary_yoloV3.txt \
    ../deepstream_app_config_yoloV3.txt \
    ../yolov3.cfg \
    ../Print_InF.txt

HEADERS += \
    ../trt_utils.h \
    ../yolo.h \
    ../yoloPlugins.h \
    ../includes/gst-nvmessage.h \
    ../includes/gst-nvquery.h \
    ../includes/gstnvdsinfer.h \
    ../includes/gstnvdsmeta.h \
    ../includes/nvbufsurface.h \
    ../includes/nvbufsurftransform.h \
    ../includes/nvds_dewarper_meta.h \
    ../includes/nvds_latency_meta.h \
    ../includes/nvds_logger.h \
    ../includes/nvds_msgapi.h \
    ../includes/nvds_opticalflow_meta.h \
    ../includes/nvds_version.h \
    ../includes/nvdsinfer_context.h \
    ../includes/nvdsinfer_custom_impl.h \
    ../includes/nvdsinfer_dbscan.h \
    ../includes/nvdsinfer_tlt.h \
    ../includes/nvdsinfer_utils.h \
    ../includes/nvdsinfer.h \
    ../includes/nvdsmeta_schema.h \
    ../includes/nvdsmeta.h \
    ../includes/nvdstracker.h \
    ../includes/nvll_osd_api.h \
    ../includes/nvll_osd_struct.h \
    ../gst-nvevent.h \
    ../gst-nvmessage.h \
    ../gst-nvquery.h \
    ../gstnvdsinfer.h \
    ../gstnvdsmeta.h \
    ../nvbufsurface.h \
    ../nvbufsurftransform.h \
    ../nvds_dewarper_meta.h \
    ../nvds_latency_meta.h \
    ../nvds_logger.h \
    ../nvds_msgapi.h \
    ../nvds_opticalflow_meta.h \
    ../nvds_version.h \
    ../nvdsinfer_context.h \
    ../nvdsinfer_custom_impl.h \
    ../nvdsinfer_dbscan.h \
    ../nvdsinfer_tlt.h \
    ../nvdsinfer_utils.h \
    ../nvdsinfer.h \
    ../nvdsmeta_schema.h \
    ../nvdsmeta.h \
    ../nvdstracker.h \
    ../nvll_osd_api.h \
    ../nvll_osd_struct.h \
    ../trt_utils.h \
    ../yolo.h \
    ../yoloPlugins.h
