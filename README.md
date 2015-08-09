# mpg123_android_build

In order to build the project add your sources to the LOCAL_SRC_FILES in jni/Android.mk .
Example:
LOCAL_SRC_FILES := myfile.cpp \
	myfile2.cpp $(MPG123_SRC_FILES)

After inserting your files run ndk-build in the make file layer.
Example:

../android-ndk/ndkbuild jni/

That will compile and create your lib for use inside your application.


