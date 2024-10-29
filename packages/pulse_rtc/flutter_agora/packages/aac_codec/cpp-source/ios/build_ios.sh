rm -fr build
mkdir build

cd build

cmake .. -G Xcode -DCMAKE_TOOLCHAIN_FILE=../ios.toolchain.cmake -DPLATFORM=OS64COMBINED
cmake --build . --config Release --target install

cd ..

DEVICE=$(xcodebuild -showsdks|grep "iphoneos"| awk '{print $4}')
ABI=$DEVICE sh cmd/ios_abi_build.sh

SIMU=$(xcodebuild -showsdks|grep "iphonesimulator"| awk '{print $6}')
ABI=$SIMU sh cmd/ios_abi_build.sh

cd build/output
cp -rf $DEVICE fat

# 面向模拟器的库文件里面包含了x86和arm64架构，面向真机设备的库文件里面包含了arm64架构，两者用lipo合并会出错，需要先从前者里面删除重复了的arm64架构部分
lipo $SIMU/Release/fdk_aac.framework/fdk_aac -remove arm64 -o $SIMU/Release/fdk_aac.framework/fdk_aac

lipo -create $DEVICE/Release/fdk_aac.framework/fdk_aac $SIMU/Release/fdk_aac.framework/fdk_aac -output fat/Release/fdk_aac.framework/fdk_aac

cd ../..

cp -rf build/output/fat/Release/fdk_aac.framework ../../ios

# 把动态库里面的LC_ID_DYLIB改写为项目内的相对地址，而不是之前写入的当前cpp源文件的路径
cd ../../ios
install_name_tool -id @rpath/fdk_aac.framework/fdk_aac fdk_aac.framework/fdk_aac