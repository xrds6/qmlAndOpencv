TEMPLATE = app

QT += qml quick widgets multimedia multimediawidgets positioning
CONFIG += c++11
QT += androidextras

QMAKE_CXXFLAGS -= -O2
QMAKE_CXXFLAGS_RELEASE -= -O2

QMAKE_CXXFLAGS += -O3
QMAKE_CXXFLAGS_RELEASE += -O3

SOURCES += main.cpp \
    src/CVCaptureAndroid.cpp \
    src/BetterVideoCapture.cpp \
    src/CameraThread.cpp \
    src/CVCamera.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat


    ANDROID_PERMISSIONS += \
        android.permission.CAMERA

    ANDROID_FEATURES += \
        android.hardware.camera


ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

android {
message("Using android configuration")

ANDROID_OPENCV = D:/android_opencv/OpenCV-3.0.0rc1-android-sdk/sdk/native

INCLUDEPATH +=D:/android_opencv/OpenCV-3.0.0rc1-android-sdk/sdk/native/jni/include

    QMAKE_CXXFLAGS -= -mfpu=vfp
    QMAKE_CXXFLAGS_RELEASE -= -mfpu=vfp
    QMAKE_CXXFLAGS += -mfpu=neon -ftree-vectorize -ftree-vectorizer-verbose=1 -mfloat-abi=softfp
    QMAKE_CXXFLAGS_RELEASE += -mfpu=neon -ftree-vectorize -ftree-vectorizer-verbose=1 -mfloat-abi=softfp


INCLUDEPATH += \
$$ANDROID_OPENCV/jni/include/opencv    \
$$ANDROID_OPENCV/jni/include/opencv2    \
$$ANDROID_OPENCV/jni/include            \

OPENCVNATIVELIBS =D:/android_opencv/OpenCV-3.0.0rc1-android-sdk/sdk/native/libs/armeabi-v7a


LIBS +=\
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_ml.a \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_videoio.a     \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_objdetect.a \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_calib3d.a \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_androidcamera.a     \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_ts.a     \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_videostab.a     \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_video.a \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_features2d.a \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_highgui.a \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_flann.a \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_imgproc.a \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_core.a     \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_hal.a     \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_imgcodecs.a     \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_photo.a     \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_shape.a     \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_stitching.a     \
        $$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_superres.a     \
        $$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/libIlmImf.a     \
        $$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/liblibwebp.a     \
        $$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/liblibjpeg.a \
        $$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/liblibpng.a \
        $$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/liblibtiff.a \
        $$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/liblibjasper.a \
        $$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/libtbb.a

 LIBS +=$$OPENCVNATIVELIBS/libopencv_java.so
}

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        D:/android_opencv/OpenCV-3.0.0rc1-android-sdk/sdk/native/libs/armeabi-v7a/libopencv_java.so\
         D:/android_opencv/OpenCV-3.0.0rc1-android-sdk/sdk/native/libs/armeabi-v7a/libnative_camera_r4.1.1.so
}

HEADERS += \
    src/CVCaptureAndroid.h \
    src/CameraActivity.hpp \
    src/BetterVideoCapture.h \
    src/CameraThread.h \
    src/CVCamera.h
