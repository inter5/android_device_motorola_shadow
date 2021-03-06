# This script is included in squisher
# It is the final build step (after OTA package)

DEVICE_OUT=$ANDROID_BUILD_TOP/out/target/product/shadow
DEVICE_TOP=$ANDROID_BUILD_TOP/device/motorola/shadow
VENDOR_TOP=$ANDROID_BUILD_TOP/vendor/motorola/shadow

# Delete unwanted apps
rm -f $REPACK/ota/system/app/VideoEditor.apk

# these scripts are not required or bad
rm -f $REPACK/ota/system/bin/sysinit
rm -f $REPACK/ota/system/etc/init.d/03firstboot
rm -f $REPACK/ota/system/etc/init.d/04modules
rm -f $REPACK/ota/system/etc/hijack-boot.zip

# add an empty script to prevent logcat errors (moto init.rc)
touch $REPACK/ota/system/bin/mount_ext3.sh
chmod +x $REPACK/ota/system/bin/mount_ext3.sh

mkdir -p $REPACK/ota/system/etc/terminfo/x
cp $REPACK/ota/system/etc/terminfo/l/linux $REPACK/ota/system/etc/terminfo/x/xterm

# prebuilt boot, devtree, logo & updater-script

rm -f $REPACK/ota/boot.img

cp -f $DEVICE_TOP/updater-script $REPACK/ota/META-INF/com/google/android/updater-script

cp -f $DEVICE_OUT/symbols/sbin/adbd $REPACK/ota/system/bin/adbd

mkdir -p $REPACK/ota/system/bootmenu
cp -rf $DEVICE_TOP/bootmenu/* $REPACK/ota/system/bootmenu/

mkdir -p $REPACK/ota/system/bootmenu/2nd-init
cp -f $DEVICE_OUT/root/init $REPACK/ota/system/bootmenu/2nd-init/init
cp -f $DEVICE_TOP/*.rc $REPACK/ota/system/bootmenu/2nd-init/
cp -f $DEVICE_TOP/bootmenu/config/default.prop $REPACK/ota/system/bootmenu/2nd-init

mkdir -p $REPACK/ota/system/bootmenu/2nd-init/sbin
cp -f $DEVICE_OUT/symbols/hijack-boot/2nd-init $REPACK/ota/system/bootmenu/2nd-init/sbin/2nd-init
cp -f $DEVICE_OUT/symbols/hijack-boot/getprop $REPACK/ota/system/bootmenu/2nd-init/sbin/getprop
cp -f $DEVICE_OUT/symbols/hijack-boot/stop $REPACK/ota/system/bootmenu/2nd-init/sbin/stop
cp -f $DEVICE_OUT/symbols/sbin/adbd $REPACK/ota/system/bootmenu/2nd-init/sbin/adbd

mkdir -p $REPACK/ota/system/bootmenu/binary
cp -f $DEVICE_OUT/symbols/hijack-boot/2nd-init $REPACK/ota/system/bootmenu/binary/2nd-init
cp -f $DEVICE_OUT/system/xbin/busybox $REPACK/ota/system/bootmenu/binary/busybox
cp -f $DEVICE_OUT/symbols/utilities/lsof $REPACK/ota/system/bootmenu/binary/lsof
cp -f $DEVICE_OUT/symbols/sbin/adbd $REPACK/ota/system/bootmenu/binary/adbd
mv $REPACK/ota/system/bin/logwrapper $REPACK/ota/system/bootmenu/binary/logwrapper.bin

cp -rf $ANDROID_BUILD_TOP/external/bootmenu/images $REPACK/ota/system/bootmenu/images

mkdir -p $REPACK/ota/system/bootmenu/ext/modules
cp -f $DEVICE_TOP/modules/cpufreq_*.ko $REPACK/ota/system/bootmenu/ext/modules
cp -f $DEVICE_TOP/modules/symsearch.ko $REPACK/ota/system/bootmenu/ext/modules
cp -f $DEVICE_TOP/modules/overclock.ko $REPACK/ota/system/bootmenu/ext/modules

mkdir -p $REPACK/ota/system/bootmenu/recovery/sbin
cp -rfd $DEVICE_OUT/recovery/root/sbin/* $REPACK/ota/system/bootmenu/recovery/sbin
find $REPACK/ota/system/bootmenu/recovery/sbin/ -type l -exec rm {} \; # remove symbolic links
mkdir -p $REPACK/ota/system/bootmenu/recovery/res
cp -rf $DEVICE_OUT/recovery/root/res/* $REPACK/ota/system/bootmenu/recovery/res 
mkdir -p $REPACK/ota/system/bootmenu/recovery/etc
cp -rf $DEVICE_OUT/recovery/root/etc/* $REPACK/ota/system/bootmenu/recovery/etc
cp -f $DEVICE_OUT/recovery/root/etc/recovery.fstab $REPACK/ota/system/bootmenu/recovery/recovery.fstab
cp -f $DEVICE_OUT/recovery/root/etc/recovery.fstab $REPACK/ota/system/bootmenu/recovery/etc/recovery.fstab

# ril fix
cp -f $REPACK/ota/system/lib/hw/audio.a2dp.default.so $REPACK/ota/system/lib/liba2dp.so

