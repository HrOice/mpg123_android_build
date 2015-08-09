LOCAL_PATH := $(call my-dir)
 
include $(CLEAR_VARS)

BUILD_LEVEL :=2014




MPG123_CFLAGS   :=  -Wall -D__ANDROID__ -I . -I libmpg123 -g\
    -DACCURATE_ROUNDING \

MPG123_CFLAGS_ARM := -O2 \
    -DOPT_ARM \
    -DREAL_IS_FIXED \
    -DASMALIGN_EXP \
    -DNO_REAL \
    -DNO_32BIT

MPG123_CFLAGS_x85 :=  -DOPT_GENERIC \
    -DASMALIGN_BYTE

ifeq ($(BUILD_LEVEL),2010)
MPG123_SRC_FILES_x86 := \
    mpg123/libmpg123.2010/synth_sse_accurate.S\
    mpg123/libmpg123.2010/synth_stereo_sse_accurate.S\
    mpg123/libmpg123.2010/synth_stereo_sse_float.S\
    mpg123/libmpg123.2010/synth_stereo_sse_s32.S\
    mpg123/libmpg123.2010/synth_sse_s32.S\
    mpg123/libmpg123.2010/synth_sse_float.S\
    mpg123/libmpg123.2010/synth_sse.S\
    mpg123/libmpg123.2010/synth_s32.c\
    mpg123/libmpg123.2010/synth_real.c\
    mpg123/libmpg123.2010/tabinit_mmx.S\
    mpg123/libmpg123.2010/dct64_i386.c\
    mpg123/libmpg123.2010/dct64_sse_float.S\
    mpg123/libmpg123.2010/dct64_sse.S\

MPG123_SRC_FILES_ARM := \
    mpg123/libmpg123.2010/synth_arm.S\
	mpg123/libmpg123.2010/synth_arm_accurate.S



MPG123_SRC_FILES := \
    mpg123/libmpg123.2010/compat.c \
    mpg123/libmpg123.2010/frame.c \
    mpg123/libmpg123.2010/id3.c \
    mpg123/libmpg123.2010/format.c \
    mpg123/libmpg123.2010/stringbuf.c \
    mpg123/libmpg123.2010/libmpg123.c\
    mpg123/libmpg123.2010/readers.c\
    mpg123/libmpg123.2010/icy.c\
	mpg123/libmpg123.2010/icy2utf8.c\
    mpg123/libmpg123.2010/index.c\
    mpg123/libmpg123.2010/layer1.c\
    mpg123/libmpg123.2010/layer2.c\
    mpg123/libmpg123.2010/layer3.c\
    mpg123/libmpg123.2010/parse.c\
 	mpg123/libmpg123.2010/optimize.c\
  	mpg123/libmpg123.2010/synth.c\
  	mpg123/libmpg123.2010/synth_8bit.c\
    mpg123/libmpg123.2010/ntom.c\
    mpg123/libmpg123.2010/dct64.c\
    mpg123/libmpg123.2010/equalizer.c\
   	mpg123/libmpg123.2010/dither.c\
    mpg123/libmpg123.2010/tabinit.c\
    mpg123/libmpg123.2010/feature.c
else

MPG123_SRC_FILES_x86 := \
    mpg123/libmpg123.2014/synth_sse_accurate.S\
    mpg123/libmpg123.2014/synth_stereo_sse_accurate.S\
    mpg123/libmpg123.2014/synth_stereo_sse_float.S\
    mpg123/libmpg123.2014/synth_stereo_sse_s32.S\
    mpg123/libmpg123.2014/synth_sse_s32.S\
    mpg123/libmpg123.2014/synth_sse_float.S\
    mpg123/libmpg123.2014/synth_sse.S\
    mpg123/libmpg123.2014/synth_s32.c\
    mpg123/libmpg123.2014/synth_real.c\
    mpg123/libmpg123.2014/tabinit_mmx.S\
    mpg123/libmpg123.2014/dct64_i386.c\
    mpg123/libmpg123.2014/dct64_sse_float.S\
    mpg123/libmpg123.2014/dct64_sse.S\

MPG123_SRC_FILES_ARM := \
    mpg123/libmpg123.2014/synth_arm.S\
	mpg123/libmpg123.2014/synth_arm_accurate.S



MPG123_SRC_FILES := \
    mpg123/libmpg123.2014/compat.c \
    mpg123/libmpg123.2014/frame.c \
    mpg123/libmpg123.2014/id3.c \
    mpg123/libmpg123.2014/format.c \
    mpg123/libmpg123.2014/stringbuf.c \
    mpg123/libmpg123.2014/libmpg123.c\
    mpg123/libmpg123.2014/readers.c\
    mpg123/libmpg123.2014/icy.c\
	mpg123/libmpg123.2014/icy2utf8.c\
    mpg123/libmpg123.2014/index.c\
    mpg123/libmpg123.2014/layer1.c\
    mpg123/libmpg123.2014/layer2.c\
    mpg123/libmpg123.2014/layer3.c\
    mpg123/libmpg123.2014/parse.c\
 	mpg123/libmpg123.2014/optimize.c\
  	mpg123/libmpg123.2014/synth.c\
  	mpg123/libmpg123.2014/synth_8bit.c\
    mpg123/libmpg123.2014/ntom.c\
    mpg123/libmpg123.2014/dct64.c\
    mpg123/libmpg123.2014/equalizer.c\
   	mpg123/libmpg123.2014/dither.c\
    mpg123/libmpg123.2014/tabinit.c\
    mpg123/libmpg123.2014/feature.c



endif


ifeq ($(TARGET_ARCH),x86)
  MPG123_SRC_FILES :=  $(MPG123_SRC_FILES) \
  $(MPG123_SRC_FILES_x86)
else
    MPG123_SRC_FILES :=  $(MPG123_SRC_FILES) \
      $(MPG123_SRC_FILES_ARM)
endif

ifeq ($(TARGET_ARCH),x86)
  MPG123_CFLAGS :=  $(MPG123_CFLAGS) \
  $(MPG123_CFLAGS_x85)
else
    MPG123_CFLAGS :=  $(MPG123_CFLAGS) \
      $(MPG123_CFLAGS_ARM)
endif







# Here we give our module name and source file(s)
LOCAL_MODULE := ccmpg123
ifeq ($(TARGET_ARCH),arm)
    LOCAL_ARM_MODE := arm
endif

$(warning $(MPG123_CFLAGS))

LOCAL_CFLAGS    := $(MPG123_CFLAGS)
LOCAL_SRC_FILES := MP3Decoder.cpp \
	MP3StreamDecoder.cpp $(MPG123_SRC_FILES)
LOCAL_LDLIBS    := -llog -g

 
include $(BUILD_SHARED_LIBRARY)