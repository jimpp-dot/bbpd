echo "build ios $ABI"
cd build

cmake .. -G Xcode -DCMAKE_TOOLCHAIN_FILE=../ios.toolchain.cmake -DPLATFORM=OS64COMBINED
cmake --build . --config Release --target install

# # xcodebuild -project SOME.xcodeproj -configuration Release -sdk $ABI -alltargets clean build
# xcodebuild OTHER_CFLAGS="-fembed-bitcode" -project SOME.xcodeproj -configuration Release -sdk $ABI -alltargets clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
xcodebuild OTHER_CFLAGS="-fembed-bitcode" -project fdk_aac.xcodeproj -configuration Release -sdk $ABI -alltargets clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
