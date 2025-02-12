#!/bin/bash
#
# AresKernel script
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software

# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Main Dir
CR_DIR=$(pwd)
# Define toolchan path
CR_TC=/compiler/bin/aarch64-none-linux-gnu-
# Define proper arch and dir for dts files
CR_DTS=arch/arm64/boot/dts
CR_DTS_TREBLE=arch/arm64/boot/universal7870.dtsi
CR_DTS_X6LTE=arch/arm64/boot/exynos7870_x6lte.dtsi
# Define boot.img out dir
CR_OUT=$CR_DIR/ARES/Out
CR_PRODUCT=$CR_DIR/ARES/Product
# Presistant A.I.K Location
CR_AIK=$CR_DIR/ARES/A.I.K
# Main Ramdisk Location
CR_RAMDISK=$CR_DIR/ARES/universal7870
# Compiled image name and location (Image/zImage)
CR_KERNEL=$CR_DIR/arch/arm64/boot/Image
# Compiled dtb by dtbtool
CR_DTB=$CR_DIR/boot.img-dtb
# Kernel Name and Version
CR_VERSION=6.9
CR_NAME=KangKernel
CR_CODENAME=Bullshit
# Thread count
CR_JOBS=$(nproc)
# Target android version and platform (7/n/8/o/9/p)
CR_ANDROID=q
CR_PLATFORM=10.0.0
# Target ARCH
CR_ARCH=arm64
# Init build
export CROSS_COMPILE=$CR_TC
# General init
export ANDROID_MAJOR_VERSION=$CR_ANDROID
export PLATFORM_VERSION=$CR_PLATFORM
export $CR_ARCH
# J710X Specific
CR_ANDROID_J710X=q
CR_PLATFORM_J710X=10.0.0
##########################################
# Device specific Variables [SM-A320X]
CR_DTSFILES_A320X="exynos7870-a3y17lte_eur_open_00.dtb exynos7870-a3y17lte_eur_open_01.dtb exynos7870-a3y17lte_eur_open_02.dtb exynos7870-a3y17lte_eur_open_03.dtb"
CR_CONFG_A320X=exynos7870-a3y17lte_defconfig
CR_VARIANT_A320X=A320X
# Device specific Variables [SM-J530_2GB (F/G/S/L/K)]
CR_DTSFILES_J530X="exynos7870-j5y17lte_sea_openm_03.dtb exynos7870-j5y17lte_sea_openm_05.dtb exynos7870-j5y17lte_sea_openm_07.dtb exynos7870-j5y17lte_eur_open_00.dtb exynos7870-j5y17lte_eur_open_01.dtb exynos7870-j5y17lte_eur_open_02.dtb exynos7870-j5y17lte_eur_open_03.dtb exynos7870-j5y17lte_eur_open_05.dtb exynos7870-j5y17lte_eur_open_07.dtb"
CR_CONFG_J530X=exynos7870-j5y17lte_defconfig
CR_VARIANT_J530X=J530X
# Device specific Variables [SM-J530_3GB (Y/YM/FM/GM)]
CR_DTSFILES_J530M="exynos7870-j5y17lte_sea_openm_03.dtb exynos7870-j5y17lte_sea_openm_05.dtb exynos7870-j5y17lte_sea_openm_07.dtb"
CR_CONFG_J530M=exynos7870-j5y17lte_defconfig
CR_VARIANT_J530M=J530Y
# Device specific Variables [SM-J730X]
CR_DTSFILES_J730X="exynos7870-j7y17lte_eur_open_00.dtb exynos7870-j7y17lte_eur_open_01.dtb exynos7870-j7y17lte_eur_open_02.dtb exynos7870-j7y17lte_eur_open_03.dtb exynos7870-j7y17lte_eur_open_04.dtb exynos7870-j7y17lte_eur_open_05.dtb exynos7870-j7y17lte_eur_open_06.dtb exynos7870-j7y17lte_eur_open_07.dtb"
CR_CONFG_J730X=exynos7870-j7y17lte_defconfig
CR_VARIANT_J730X=J730X
# Device specific Variables [SM-J710X]
CR_DTSFILES_J710X="exynos7870-j7xelte_eur_open_00.dtb exynos7870-j7xelte_eur_open_01.dtb exynos7870-j7xelte_eur_open_02.dtb exynos7870-j7xelte_eur_open_03.dtb exynos7870-j7xelte_eur_open_04.dtb"
CR_CONFG_J710X=exynos7870-j7xelte_defconfig
CR_VARIANT_J710X=J710X
# Device specific Variables [SM-J701X]
CR_DTSFILES_J701X="exynos7870-j7velte_sea_open_00.dtb exynos7870-j7velte_sea_open_01.dtb exynos7870-j7velte_sea_open_03.dtb"
CR_CONFG_J701X=exynos7870-j7velte_defconfig
CR_VARIANT_J701X=J701X
# Device specific Variables [SM-G610X]
CR_DTSFILES_G610X="exynos7870-on7xelte_swa_open_00.dtb exynos7870-on7xelte_swa_open_01.dtb exynos7870-on7xelte_swa_open_02.dtb"
CR_CONFG_G610X=exynos7870-on7xelte_defconfig
CR_VARIANT_G610X=G610X
# Device specific Variables [SM-J600X]
CR_DTSFILES_J600X="exynos7870-j6lte_ltn_00.dtb exynos7870-j6lte_ltn_02.dtb"
CR_CONFG_J600X=exynos7870-j6lte_defconfig
CR_VARIANT_J600X=J600X
# Device specific Variables [SM-A600X]
CR_DTSFILES_A600X="exynos7870-a6lte_eur_open_00.dtb exynos7870-a6lte_eur_open_01.dtb exynos7870-a6lte_eur_open_02.dtb exynos7870-a6lte_eur_open_03.dtb"
CR_CONFG_A600X=exynos7870-a6lte_defconfig
CR_VARIANT_A600X=A600X
# Common configs
CR_CONFIG_TREBLE=exynos7870-treble_defconfig
CR_CONFIG_ONEUI=exynos7870-oneui_defconfig
CR_CONFIG_SPLIT=NULL
CR_CONFIG_ARES=exynos7870-ares_defconfig
# Prefixes
CR_ROOT="0"
CR_PERMISSIVE="0"
CR_HALLIC="0"
# Flashable Variables
FL_MODEL=NULL
FL_VARIANT=NULL
FL_DIR=$CR_DIR/ARES/Flashable
FL_EXPORT=$CR_DIR/ARES/Flashable_OUT
FL_SCRIPT=$FL_EXPORT/META-INF/com/google/android/updater-script
#####################################################

# Script functions
CR_CLEAN="1"
CR_MODE="2"
CR_HALLIC="1"
CR_PERMISSIVE="0"

BUILD_CLEAN()
{
if [ $CR_CLEAN = 1 ]; then
     echo " "
     echo " Cleaning build dir"
     make clean && make mrproper
     rm -r -f $CR_DTB
     rm -rf $CR_DTS/.*.tmp
     rm -rf $CR_DTS/.*.cmd
     rm -rf $CR_DTS/*.dtb
     rm -rf $CR_DIR/.config
     rm -rf $CR_DTS/exynos7870.dtsi
     rm -rf $CR_OUT/*.img
     rm -rf $CR_OUT/*.zip
fi
if [ $CR_CLEAN = 0 ]; then
     echo " "
     echo " Skip Full cleaning"
     rm -r -f $CR_DTB
     rm -rf $CR_DTS/.*.tmp
     rm -rf $CR_DTS/.*.cmd
     rm -rf $CR_DTS/*.dtb
     rm -rf $CR_DIR/.config
     rm -rf $CR_DTS/exynos7870.dtsi
fi
}

BUILD_ROOT()
{
if [ $CR_ROOT = 1 ]; then
     echo " "
     echo " WARNING : KernelSU Enabled!"
fi
}

BUILD_IMAGE_NAME()
{
	CR_IMAGE_NAME=$CR_NAME-$CR_VERSION-$CR_CODENAME

  # Flashable_script
  if [ $CR_VARIANT = $CR_VARIANT_A320X-TREBLE ]; then
    FL_VARIANT="A320X-TREBLE"
    FL_MODEL=a3y17lte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_A320X-ONEUI ]; then
    FL_VARIANT="A320X-OneUI"
    FL_MODEL=a3y17lte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_J530X-TREBLE ]; then
    FL_VARIANT="J530X-TREBLE"
    FL_MODEL=j5y17lte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_J530X-ONEUI ]; then
    FL_VARIANT="J530X-OneUI"
    FL_MODEL=j5y17lte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_J730X-TREBLE ]; then
    FL_VARIANT="J730X-TREBLE"
    FL_MODEL=j7y17lte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_J730X-ONEUI ]; then
    FL_VARIANT="J730X-OneUI"
    FL_MODEL=j7y17lte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_J710X-TREBLE ]; then
    FL_VARIANT="J710X-TREBLE"
    FL_MODEL=j7xelte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_J710X-ONEUI ]; then
    FL_VARIANT="J710X-OneUI"
    FL_MODEL=j7xelte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_J701X-TREBLE ]; then
    FL_VARIANT="J701X-TREBLE"
    FL_MODEL=j7velte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_J701X-ONEUI ]; then
    FL_VARIANT="J701X-OneUI"
    FL_MODEL=j7velte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_G610X-TREBLE ]; then
    FL_VARIANT="G610X-TREBLE"
    FL_MODEL=on7xelte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_G610X-ONEUI ]; then
    FL_VARIANT="G610X-OneUI"
    FL_MODEL=on7xelte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_J600X-TREBLE ]; then
    FL_VARIANT="J600X-TREBLE"
    FL_MODEL=j6lte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_J600X-ONEUI ]; then
    FL_VARIANT="J600X-OneUI"
    FL_MODEL=j6lte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_A600X-TREBLE ]; then
    FL_VARIANT="A600X-TREBLE"
    FL_MODEL=a6lte
  fi
  if [ $CR_VARIANT = $CR_VARIANT_A600X-ONEUI ]; then
    FL_VARIANT="A600X-OneUI"
    FL_MODEL=a6lte
  fi
}

BUILD_GENERATE_CONFIG()
{
  # Only use for devices that are unified with 2 or more configs
  echo "----------------------------------------------"
	echo " "
	echo "Building defconfig for $CR_VARIANT"
  echo " "
  # Respect CLEAN build rules
  BUILD_CLEAN
  if [ -e $CR_DIR/arch/$CR_ARCH/configs/tmp_defconfig ]; then
    echo " cleanup old configs "
    rm -rf $CR_DIR/arch/$CR_ARCH/configs/tmp_defconfig
  fi
  echo " Copy $CR_CONFIG "
  cp -f $CR_DIR/arch/$CR_ARCH/configs/$CR_CONFIG $CR_DIR/arch/$CR_ARCH/configs/tmp_defconfig
  if [ $CR_CONFIG_SPLIT = NULL ]; then
    echo " No split config support! "
  else
    echo " Copy $CR_CONFIG_SPLIT "
    cat $CR_DIR/arch/$CR_ARCH/configs/$CR_CONFIG_SPLIT >> $CR_DIR/arch/$CR_ARCH/configs/tmp_defconfig
  fi
  if [ $CR_MODE = 2 ]; then
    echo " Copy $CR_CONFIG_USB "
    cat $CR_DIR/arch/$CR_ARCH/configs/$CR_CONFIG_USB >> $CR_DIR/arch/$CR_ARCH/configs/tmp_defconfig
  fi
  if [ $CR_MODE = 1 ]; then
    echo " Copy $CR_CONFIG_USB "
    cat $CR_DIR/arch/$CR_ARCH/configs/$CR_CONFIG_USB >> $CR_DIR/arch/$CR_ARCH/configs/tmp_defconfig
  fi
  echo " Copy $CR_CONFIG_ARES "
  cat $CR_DIR/arch/$CR_ARCH/configs/$CR_CONFIG_ARES >> $CR_DIR/arch/$CR_ARCH/configs/tmp_defconfig
  echo " Set $CR_VARIANT to generated config "
  CR_CONFIG=tmp_defconfig
}

BUILD_OUT()
{
    echo " "
    echo "----------------------------------------------"
    echo "$CR_VARIANT kernel build finished."
    echo "Compiled DTB Size = $sizdT Kb"
    echo "Kernel Image Size = $sizT Kb"
    echo "Boot Image   Size = $sizkT Kb"
    echo "Image Generated at $CR_PRODUCT/$CR_IMAGE_NAME.img"
    echo "Zip Generated at $CR_PRODUCT/$CR_NAME.zip"
    echo "Press Any key to end the script"
    echo "----------------------------------------------"
}

BUILD_ZIMAGE()
{
	echo "----------------------------------------------"
	echo " "
	echo "Building zImage for $CR_VARIANT"
	export LOCALVERSION=-$CR_IMAGE_NAME
  cp $CR_DTB_MOUNT $CR_DTS/exynos7870.dtsi
	echo "Make $CR_CONFIG"
	make $CR_CONFIG
	make -j$CR_JOBS
	if [ ! -e $CR_KERNEL ]; then
	exit 0;
	echo "Image Failed to Compile"
	echo " Abort "
	fi
    du -k "$CR_KERNEL" | cut -f1 >sizT
    sizT=$(head -n 1 sizT)
    rm -rf sizT
	echo " "
	echo "----------------------------------------------"
}
BUILD_DTB()
{
	echo "----------------------------------------------"
	echo " "
	echo "Building DTB for $CR_VARIANT"
	# This source compiles dtbs while doing Image
	./scripts/dtbtool_exynos/dtbTool -o $CR_DTB -d $CR_DTS/ -s 2048
	if [ ! -e $CR_DTB ]; then
    exit 0;
    echo "DTB Failed to Compile"
    echo " Abort "
	fi
	rm -rf $CR_DTS/.*.tmp
	rm -rf $CR_DTS/.*.cmd
	rm -rf $CR_DTS/*.dtb
  rm -rf $CR_DTS/exynos7870.dtsi
    du -k "$CR_DTB" | cut -f1 >sizdT
    sizdT=$(head -n 1 sizdT)
    rm -rf sizdT
	echo " "
	echo "----------------------------------------------"
}
PACK_BOOT_IMG()
{
	echo "----------------------------------------------"
	echo " "
	echo "Building Boot.img for $CR_VARIANT"
	# Copy Ramdisk
	cp -rf $CR_RAMDISK/* $CR_AIK
	# Move Compiled kernel and dtb to A.I.K Folder
	mv $CR_KERNEL $CR_AIK/split_img/boot.img-zImage
	mv $CR_DTB $CR_AIK/split_img/boot.img-dtb
	# Create boot.img
	$CR_AIK/repackimg.sh
	# Remove red warning at boot
	echo -n "SEANDROIDENFORCE" » $CR_AIK/image-new.img
  # Copy boot.img to Production folder
	cp $CR_AIK/image-new.img $CR_PRODUCT/$CR_IMAGE_NAME.img
	# Move boot.img to out dir
	mv $CR_AIK/image-new.img $CR_OUT/$CR_IMAGE_NAME.img
	du -k "$CR_OUT/$CR_IMAGE_NAME.img" | cut -f1 >sizkT
	sizkT=$(head -n 1 sizkT)
	rm -rf sizkT
	echo " "
	$CR_AIK/cleanup.sh
}

PACK_FLASHABLE()
{

  echo "----------------------------------------------"
  echo "$CR_NAME $CR_VERSION Flashable Generator"
  echo "----------------------------------------------"
	echo " "
	echo " Target device : $CR_VARIANT "
  echo " Target image $CR_OUT/$CR_IMAGE_NAME.img "
  echo " Prepare Temporary Dirs"
  FL_DEVICE=$FL_EXPORT/ARES/device/$FL_MODEL/boot.img
  echo " Copy $FL_DIR to $FL_EXPORT"
  rm -rf $FL_EXPORT
  mkdir $FL_EXPORT
  cp -rf $FL_DIR/* $FL_EXPORT
  echo " Generate updater for $FL_VARIANT"
  sed -i 's/FL_NAME/ui_print("* '$CR_NAME'");/g' $FL_SCRIPT
  sed -i 's/FL_VERSION/ui_print("* '$CR_VERSION'");/g' $FL_SCRIPT
  sed -i 's/FL_VARIANT/ui_print("* For '$FL_VARIANT' ");/g' $FL_SCRIPT
  echo " Copy Image to $FL_DEVICE"
  cp $CR_OUT/$CR_IMAGE_NAME.img $FL_DEVICE
  echo " Packing zip"
  # TODO: FInd a better way to zip
  # TODO: support multi-compile
  # TODO: Conditional
  cd $FL_EXPORT
  zip -r $CR_OUT/$CR_NAME-$CR_VERSION-$FL_VARIANT.zip .
  cd $CR_DIR
  rm -rf $FL_EXPORT
  # Copy zip to production
  cp $CR_OUT/$CR_NAME-$CR_VERSION-$FL_VARIANT.zip $CR_PRODUCT
  # Move out dir to BUILD_OUT
  # Respect CLEAN build rules
  BUILD_CLEAN
}

# Main Menu
clear
echo "----------------------------------------------"
echo "$CR_NAME $CR_VERSION Build Script"
echo "----------------------------------------------"
PS3='Please select your option (1-10): '
menuvar=("SM-A320X" "SM-J530X" "SM-J730X" "SM-J710X" "SM-J701X" "SM-G610X" "SM-J600X" "SM-A600X" "Build_All" "Exit")
select menuvar in "${menuvar[@]}"
do
    case $menuvar in
        "SM-A320X")
            clear
            echo "Starting $CR_VARIANT_A320X kernel build..."
            CR_CONFIG=$CR_CONFG_A320X
            CR_DTSFILES=$CR_DTSFILES_A320X
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_A320X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_A320X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            read -n1 -r key
            break
            ;;
        "SM-J530X")
            clear
            echo "Starting $CR_VARIANT_J530X kernel build..."
            CR_CONFIG=$CR_CONFG_J530X
            CR_DTSFILES=$CR_DTSFILES_J530X
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_J530X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_J530X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            read -n1 -r key
            break
            ;;
        "SM-J730X")
            clear
            echo "Starting $CR_VARIANT_J730X kernel build..."
            CR_VARIANT=$CR_VARIANT_J730X
            CR_CONFIG=$CR_CONFG_J730X
            CR_DTSFILES=$CR_DTSFILES_J730X
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_J730X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_J730X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            read -n1 -r key
            break
            ;;
        "SM-J710X")
            clear
            echo "Starting $CR_VARIANT_J710X kernel build..."
            export ANDROID_MAJOR_VERSION=$CR_ANDROID_J710X
            export PLATFORM_VERSION=$CR_PLATFORM_J710X
            CR_CONFIG=$CR_CONFG_J710X
            CR_DTSFILES=$CR_DTSFILES_J710X
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_J710X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_J710X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            read -n1 -r key
            break
            ;;
        "SM-J701X")
            clear
            echo "Starting $CR_VARIANT_J701X kernel build..."
            CR_CONFIG=$CR_CONFG_J701X
            CR_DTSFILES=$CR_DTSFILES_J701X
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_J701X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_J701X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            read -n1 -r key
            break
            ;;
        "SM-G610X")
            clear
            echo "Starting $CR_VARIANT_G610X kernel build..."
            CR_CONFIG=$CR_CONFG_G610X
            CR_DTSFILES=$CR_DTSFILES_G610X
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_G610X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_G610X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            read -n1 -r key
            break
            ;;
        "SM-J600X")
            clear
            echo "Starting $CR_VARIANT_J600X kernel build..."
            CR_DTSFILES=$CR_DTSFILES_J600X
            CR_RAMDISK=$CR_RAMDISK
            CR_CONFIG=$CR_CONFG_J600X
            CR_DTB_MOUNT=$CR_DTS_X6LTE
            export ANDROID_MAJOR_VERSION=$CR_ANDROID
            export PLATFORM_VERSION=$CR_PLATFORM
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_J600X-TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_J600X-ONEUI
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            read -n1 -r key
            break
            ;;
        "SM-A600X")
            clear
            echo "Starting $CR_VARIANT_A600X kernel build..."
            CR_DTSFILES=$CR_DTSFILES_A600X
            CR_RAMDISK=$CR_RAMDISK
            CR_CONFIG=$CR_CONFG_A600X
            CR_DTB_MOUNT=$CR_DTS_X6LTE
            export ANDROID_MAJOR_VERSION=$CR_ANDROID
            export PLATFORM_VERSION=$CR_PLATFORM
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_A600X-TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_A600X-ONEUI
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            read -n1 -r key
            break
            ;;
        "Build_All")
            echo "Starting $CR_VARIANT_A320X kernel build..."
            CR_CONFIG=$CR_CONFG_A320X
            CR_DTSFILES=$CR_DTSFILES_A320X
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_A320X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_A320X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            echo "Starting $CR_VARIANT_J530X kernel build..."
            CR_CONFIG=$CR_CONFG_J530X
            CR_DTSFILES=$CR_DTSFILES_J530X
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_J530X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_J530X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            echo "Starting $CR_VARIANT_J730X kernel build..."
            CR_VARIANT=$CR_VARIANT_J730X
            CR_CONFIG=$CR_CONFG_J730X
            CR_DTSFILES=$CR_DTSFILES_J730X
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_J730X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_J730X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            echo "Starting $CR_VARIANT_J710X kernel build..."
            # Build Nougat WiFi HAL
            export ANDROID_MAJOR_VERSION=$CR_ANDROID_J710X
            export PLATFORM_VERSION=$CR_PLATFORM_J710X
            CR_CONFIG=$CR_CONFG_J710X
            CR_DTSFILES=$CR_DTSFILES_J710X
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_J710X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_J710X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            echo "Starting $CR_VARIANT_J701X kernel build..."
            CR_CONFIG=$CR_CONFG_J701X
            CR_DTSFILES=$CR_DTSFILES_J701X
            # Build Oreo WiFi HAL
            export ANDROID_MAJOR_VERSION=$CR_ANDROID
            export PLATFORM_VERSION=$CR_PLATFORM
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_J701X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_J701X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            echo "Starting $CR_VARIANT_G610X kernel build..."
            CR_CONFIG=$CR_CONFG_G610X
            CR_DTSFILES=$CR_DTSFILES_G610X
            # Build Oreo WiFi HAL
            export ANDROID_MAJOR_VERSION=$CR_ANDROID
            export PLATFORM_VERSION=$CR_PLATFORM
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_G610X-TREBLE
              CR_RAMDISK=$CR_RAMDISK
              CR_DTB_MOUNT=$CR_DTS_TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_G610X-ONEUI
              CR_DTB_MOUNT=$CR_DTS_TREBLE
              CR_RAMDISK=$CR_RAMDISK
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            echo "Starting $CR_VARIANT_J600X kernel build..."
            CR_DTSFILES=$CR_DTSFILES_J600X
            CR_RAMDISK=$CR_RAMDISK
            CR_CONFIG=$CR_CONFG_J600X
            CR_DTB_MOUNT=$CR_DTS_X6LTE
            # Build Oreo WiFi HAL
            export ANDROID_MAJOR_VERSION=$CR_ANDROID
            export PLATFORM_VERSION=$CR_PLATFORM
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_J600X-TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_J600X-ONEUI
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            echo "Starting $CR_VARIANT_A600X kernel build..."
            CR_DTSFILES=$CR_DTSFILES_A600X
            CR_RAMDISK=$CR_RAMDISK
            CR_CONFIG=$CR_CONFG_A600X
            CR_DTB_MOUNT=$CR_DTS_X6LTE
            # Build Oreo WiFi HAL
            export ANDROID_MAJOR_VERSION=$CR_ANDROID
            export PLATFORM_VERSION=$CR_PLATFORM
            if [ $CR_MODE = "2" ]; then
              echo " Building TREBLE variant "
              CR_CONFIG_USB=$CR_CONFIG_TREBLE
              CR_VARIANT=$CR_VARIANT_A600X-TREBLE
            else
              echo " Building OneUI variant "
              CR_CONFIG_USB=$CR_CONFIG_ONEUI
              CR_VARIANT=$CR_VARIANT_A600X-ONEUI
            fi
            BUILD_IMAGE_NAME
            BUILD_GENERATE_CONFIG
            BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            BUILD_ROOT
            PACK_FLASHABLE
            BUILD_OUT
            echo " "
            echo " "
            echo " compilation finished "
            echo " Targets at $CR_OUT"
            echo " "
            echo "Press Any key to end the script"
            echo "----------------------------------------------"
            read -n1 -r key
            break
            ;;
        "Exit")
            break
            ;;
        *) echo Invalid option.;;
    esac
done
