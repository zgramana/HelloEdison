#!/bin/sh

# Linux-specific instructions
#export AS="as -arch i386"
#export CC="cc -lmraa -arch i386"
export MONO_PATH=/usr/lib/mono/4.5
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig:$MONO_PATH/lib/pkgconfig:/usr/bin
export LD_LIBRARY_PATH=$MONO_PATH
export PATH=$PATH:$MONO_PATH

if CROSS_COMPILE
	source /opt/poky-edison/1.7.2/environment-setup-core2-32-poky-linux
	#export AS="as -arch i386"
	#export CC="cc -lmraa -arch i386"
	export MONO_PATH=/usr/lib/mono/4.5
	export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig:$MONO_PATH/lib/pkgconfig:/usr/bin
	export LD_LIBRARY_PATH=$MONO_PATH
	export PATH=$PATH:$MONO_PATH
fi

set -e

xbuild /p:Configuration=Release /t:Clean

xbuild /p:Configuration=Release

cwd=`pwd`
cd bin/Release

if [[ -f "HelloEdison" ]]; then
    rm HelloEdison
fi

mkbundle --deps --static -o ../../HelloEdison HelloEdison.exe *.dll

cd $cwd
