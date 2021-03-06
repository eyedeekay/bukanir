#!/usr/bin/env bash

export PATH=/opt/android-toolchain-arm7/bin:/opt/android-toolchain-arm64/bin:/opt/android-toolchain-x86/bin:${PATH}

mkdir -p build

ANDROID_TOOLCHAIN="/opt/android-toolchain-arm7"
export CC=arm-linux-androideabi-gcc CXX=arm-linux-androideabi-g++
export PKG_CONFIG_PATH=$ANDROID_TOOLCHAIN/lib/pkgconfig
export PKG_CONFIG_LIBDIR=$ANDROID_TOOLCHAIN/lib/pkgconfig
CC=arm-linux-androideabi-gcc CXX=arm-linux-androideabi-g++ \
CGO_ENABLED=1 GOOS=android GOARCH=arm \
gomobile bind -v -x -o build/bukanir-arm7.aar -target android/arm -ldflags "-s -w" github.com/gen2brain/bukanir/lib

ANDROID_TOOLCHAIN="/opt/android-toolchain-arm64"
export CC=aarch64-linux-android-gcc CXX=aarch64-linux-android-g++
export PKG_CONFIG_PATH=$ANDROID_TOOLCHAIN/lib/pkgconfig
export PKG_CONFIG_LIBDIR=$ANDROID_TOOLCHAIN/lib/pkgconfig
CC=aarch64-linux-android-gcc CXX=aarch64-linux-android-g++ \
CGO_ENABLED=1 GOOS=android GOARCH=arm64 \
gomobile bind -v -x -o build/bukanir-arm64.aar -target android/arm64 -ldflags "-s -w" github.com/gen2brain/bukanir/lib

ANDROID_TOOLCHAIN="/opt/android-toolchain-x86"
export CC=i686-linux-android-gcc CXX=i686-linux-android-g++
export PKG_CONFIG_PATH=$ANDROID_TOOLCHAIN/lib/pkgconfig
export PKG_CONFIG_LIBDIR=$ANDROID_TOOLCHAIN/lib/pkgconfig
CC=i686-linux-android-gcc CXX=i686-linux-android-g++ \
CGO_ENABLED=1 GOOS=android GOARCH=386 \
gomobile bind -v -x -o build/bukanir-x86.aar -target android/386 -ldflags "-s -w" github.com/gen2brain/bukanir/lib
