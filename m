#/bin/sh

if [ -z "$1" ]; then
	prj=$(realpath "../")
else
	prj=$(realpath "$1")
fi
if [ -z "$2" ]; then
	lib=$(realpath "/usr/local/src/STM32Cube_FW_F1_V1.3.0/")
else
	lib=$(realpath "$2")
fi
if [ ! -d "$prj" ]; then
	echo "$prj is not a directory" 1>&2
	exit 1
fi
if [ ! -d "$lib" ]; then
	echo "$lib is not a directory" 1>&2
	exit 1
fi

src="$prj"/STCube/Src/
inc="$prj"/STCube/Inc/
tools="$prj"/STCube/tools/


g++ gpio-cfg.cpp \
	--std=c++11 \
	-D STM32F103xB \
	-I "$inc" \
	-I "$tools" \
	-I "$lib"/Drivers/STM32F1xx_HAL_Driver/Inc/ \
	-I "$lib"/Drivers/CMSIS/Device/ST/STM32F1xx/Include/ \
	-I "$lib"/Drivers/CMSIS/Include/ \
	-o gpio-cfg
 
 ./gpio-cfg "$inc" "$src"
