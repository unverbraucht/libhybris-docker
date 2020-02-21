

mkdir lib

# This path is for use on a Mac. Linux path is different
cp -r ~/Library/Android/sdk//ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/sysroot/usr/lib/86_64-linux-android/23 lib/armv7l

cp -r ~/Library/Android/sdk/ndk-bundle//toolchains/llvm/prebuilt/darwin-x86_64/sysroot/usr/lib/arm-linux-androideabi/23 lib/x86_64

cp -r ~/Library/Android/sdk/ndk-bundle//toolchains/llvm/prebuilt/darwin-x86_64/sysroot/usr/lib/i686-linux-android/23 lib/i386

wget https://launchpad.net/ubuntu/+archive/primary/+files/android-headers_23.orig.tar.gz
