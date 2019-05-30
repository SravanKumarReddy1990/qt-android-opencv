TEMPLATE = app

CONFIG += c++11
QT += qml quick widgets multimedia multimediawidgets positioning

TARGET=See

SOURCES += main.cpp \
    presentationpropertyholder.cpp \
    geolocationmanager.cpp \
    imageprocessor.cpp \
    cameracontrol.cpp \
    flowcontroller.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    presentationpropertyholder.h \
    geolocationmanager.h \
    imageprocessor.h \
    cameracontrol.h \
    flowcontroller.h


android {

 LIBS += -L$$PWD/../OpenCV-4.1.0-Android/OpenCV-android-sdk/sdk/native/libs/armeabi-v7a/ -lopencv_java4

INCLUDEPATH += $$PWD/../OpenCV-4.1.0-Android/OpenCV-android-sdk/sdk/native/jni/include
DEPENDPATH += $$PWD/../OpenCV-4.1.0-Android/OpenCV-android-sdk/sdk/native/jni/include

#INCLUDEPATH += -I"$$PWD/../OpenCV-4.1.0-Android/OpenCV-android-sdk/sdk/native/libs/armeabi-v7a/libopencv_java4.so"

LIBS += -L$$PWD/../OpenCV-4.1.0-Android/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a\


 #Enable automatic NEON vectorization
    QMAKE_CXXFLAGS -= -mfpu=vfp
    QMAKE_CXXFLAGS_RELEASE -= -mfpu=vfp
   # QMAKE_CXXFLAGS += -mfpu=neon -ftree-vectorize -ftree-vectorizer-verbose=1 -mfloat-abi=softfp
    QMAKE_CXXFLAGS += -mfpu=neon -ftree-vectorize -mfloat-abi=softfp
    QMAKE_CXXFLAGS_RELEASE += -mfpu=neon -ftree-vectorize -ftree-vectorizer-verbose=1 -mfloat-abi=softfp

    ANDROID_PACKAGE_SOURCE_DIR=$$_PRO_FILE_PWD_/android
}

DISTFILES += \
    android/src/com/bsmaps/chat/NotificationClient.java\
    android/res/values/libs.xml \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/../OpenCV-4.1.0-Android/OpenCV-android-sdk/sdk/native/libs/armeabi-v7a/libopencv_java4.so
}
