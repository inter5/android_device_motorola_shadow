# Copyright (C) 2011 The Android Open Source Project
#
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

DEVICE := device/motorola/shadow

PRODUCT_COPY_FILES += \
	$(DEVICE)/prebuilt/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
	$(DEVICE)/prebuilt/etc/terminfo/x/xterm:system/etc/terminfo/x/xterm \

#key layouts, names must fit the ones in /proc/bus/input/devices, qwerty.kl is the fallback one.
PRODUCT_COPY_FILES += \
	$(DEVICE)/prebuilt/usr/idc/internal.idc:system/usr/idc/lm3530_led.idc \
	$(DEVICE)/prebuilt/usr/idc/internal.idc:system/usr/idc/accelerometer.idc \
	$(DEVICE)/prebuilt/usr/idc/internal.idc:system/usr/idc/compass.idc \
	$(DEVICE)/prebuilt/usr/idc/internal.idc:system/usr/idc/light-prox.idc \
	$(DEVICE)/prebuilt/usr/idc/internal.idc:system/usr/idc/proximity.idc \
	$(DEVICE)/prebuilt/usr/idc/sholes-keypad.idc:system/usr/idc/sholes-keypad.idc \
	$(DEVICE)/prebuilt/usr/idc/cpcap-key.idc:system/usr/idc/cpcap-key.idc \
	$(DEVICE)/prebuilt/usr/idc/qtouch-touchscreen.idc:system/usr/idc/qtouch-touchscreen.idc \
	$(DEVICE)/prebuilt/usr/qwerty.kl:system/usr/keylayout/qwerty.kl \
	$(DEVICE)/prebuilt/usr/qwerty.kl:system/usr/keylayout/qtouch-touchscreen.kl \
	$(DEVICE)/prebuilt/usr/keypad.kl:system/usr/keylayout/sholes-keypad.kl \
	$(DEVICE)/prebuilt/usr/keypad.kl:system/usr/keylayout/umts_jordan-keypad.kl \
	$(DEVICE)/prebuilt/usr/cpcap-key.kl:system/usr/keylayout/cpcap-key.kl \
	$(DEVICE)/prebuilt/usr/keychars/cpcap-key.kcm:system/usr/keychars/cpcap-key.kcm \

#etc
PRODUCT_COPY_FILES += \
	$(DEVICE)/bootmenu/recovery/recovery.fstab:system/etc/recovery.fstab \
	$(DEVICE)/prebuilt/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
	$(DEVICE)/prebuilt/etc/profile:system/etc/profile \
	$(DEVICE)/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf \
	$(DEVICE)/prebuilt/etc/busybox.fstab:system/etc/fstab \
	$(DEVICE)/prebuilt/etc/wifi/dnsmasq.conf:system/etc/wifi/dnsmasq.conf \
	$(DEVICE)/prebuilt/etc/wifi/tiwlan.ini:system/etc/wifi/tiwlan.ini \
	$(DEVICE)/prebuilt/etc/wifi/tiwlan_ap.ini:system/etc/wifi/tiwlan_ap.ini \
	$(DEVICE)/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(DEVICE)/prebuilt/etc/gpsconfig.xml:system/etc/gpsconfig.xml \
	$(DEVICE)/prebuilt/etc/location.cfg:system/etc/location.cfg \
	$(DEVICE)/media_profiles.xml:system/etc/media_profiles.xml \
	$(DEVICE)/modules/modules.alias:system/lib/modules/modules.alias \
	$(DEVICE)/modules/modules.dep:system/lib/modules/modules.dep \

ifdef CM_RELEASE
	PRODUCT_COPY_FILES += $(DEVICE)/custom_backup_release.txt:system/etc/custom_backup_list.txt
else
	PRODUCT_COPY_FILES += $(DEVICE)/custom_backup_list.txt:system/etc/custom_backup_list.txt
endif

#Bootmenu
PRODUCT_COPY_FILES += \
	$(DEVICE)/init.mapphone_cdma.rc:system/bootmenu/2nd-init/init.mapphone_umts.rc \
	$(DEVICE)/init.mapphone_cdma.usb.rc:system/bootmenu/2nd-init/init.mapphone_cdma.usb.rc \
	$(DEVICE)/init.rc:system/bootmenu/2nd-init/init.rc \
	$(DEVICE)/ueventd.rc:system/bootmenu/2nd-init/ueventd.rc \
        $(DEVICE)/ueventd.mapphone_cdma.rc:system/bootmenu/2nd-init/ueventd.mapphone_cdma.rc \
	$(DEVICE)/bootmenu/binary/adbd:system/bootmenu/binary/adbd \
	$(DEVICE)/bootmenu/binary/logwrapper.bin:system/bootmenu/binary/logwrapper.bin \
	$(DEVICE)/bootmenu/binary/logwrapper.bin:system/bin/logwrapper.bin \
	$(DEVICE)/bootmenu/binary/2nd-boot:system/bootmenu/binary/2nd-boot \
	$(DEVICE)/bootmenu/binary/su:system/bootmenu/ext/su \
	$(DEVICE)/bootmenu/config/bootmenu_bypass:system/bootmenu/config/bootmenu_bypass \
	$(DEVICE)/bootmenu/config/default.prop:system/bootmenu/config/default.prop \
	$(DEVICE)/bootmenu/config/default_bootmode.conf:system/bootmenu/config/default_bootmode.conf \
	$(DEVICE)/bootmenu/config/overclock.conf:system/bootmenu/config/overclock.conf \
	$(DEVICE)/bootmenu/images/background.png:system/bootmenu/images/background.png \
	external/bootmenu/images/indeterminate1.png:system/bootmenu/images/indeterminate1.png \
	external/bootmenu/images/indeterminate2.png:system/bootmenu/images/indeterminate2.png \
	external/bootmenu/images/indeterminate3.png:system/bootmenu/images/indeterminate3.png \
	external/bootmenu/images/indeterminate4.png:system/bootmenu/images/indeterminate4.png \
	external/bootmenu/images/indeterminate5.png:system/bootmenu/images/indeterminate5.png \
	external/bootmenu/images/indeterminate6.png:system/bootmenu/images/indeterminate6.png \
	external/bootmenu/images/progress_empty.png:system/bootmenu/images/progress_empty.png \
	external/bootmenu/images/progress_fill.png:system/bootmenu/images/progress_fill.png \
	$(DEVICE)/bootmenu/recovery/sbin/badblocks:system/bootmenu/recovery/sbin/badblocks \
	$(DEVICE)/bootmenu/recovery/sbin/dedupe:system/bootmenu/recovery/sbin/dedupe \
	$(DEVICE)/bootmenu/recovery/sbin/dump_image:system/bootmenu/recovery/sbin/dump_image \
	$(DEVICE)/bootmenu/recovery/sbin/e2fsck:system/bootmenu/recovery/sbin/e2fsck \
	$(DEVICE)/bootmenu/recovery/sbin/fix_permissions:system/bootmenu/recovery/sbin/fix_permissions \
	$(DEVICE)/bootmenu/recovery/sbin/killrecovery.sh:system/bootmenu/recovery/sbin/killrecovery.sh \
	$(DEVICE)/bootmenu/recovery/sbin/nandroid-md5.sh:system/bootmenu/recovery/sbin/nandroid-md5.sh \
	$(DEVICE)/bootmenu/recovery/sbin/parted:system/bootmenu/recovery/sbin/parted \
	$(DEVICE)/bootmenu/recovery/sbin/postrecoveryboot.sh:system/bootmenu/recovery/sbin/postrecoveryboot.sh \
	$(DEVICE)/bootmenu/recovery/sbin/recovery:system/bootmenu/recovery/sbin/recovery_stable \
	$(DEVICE)/bootmenu/recovery/sbin/resize2fs:system/bootmenu/recovery/sbin/resize2fs \
	$(DEVICE)/bootmenu/recovery/sbin/sdparted:system/bootmenu/recovery/sbin/sdparted \
	$(DEVICE)/bootmenu/recovery/sbin/mke2fs:system/bootmenu/recovery/sbin/mke2fs \
	$(DEVICE)/bootmenu/recovery/sbin/mke2fs.bin:system/bootmenu/recovery/sbin/mke2fs.bin \
	$(DEVICE)/bootmenu/recovery/sbin/tune2fs.bin:system/bootmenu/recovery/sbin/tune2fs \
	$(DEVICE)/bootmenu/recovery/recovery.fstab:system/bootmenu/recovery/recovery.fstab \
	$(DEVICE)/bootmenu/script/_config.sh:system/bootmenu/script/_config.sh \
	$(DEVICE)/bootmenu/script/2nd-init.sh:system/bootmenu/script/2nd-init.sh \
	$(DEVICE)/bootmenu/script/2nd-boot.sh:system/bootmenu/script/2nd-boot.sh \
	$(DEVICE)/bootmenu/script/stock.sh:system/bootmenu/script/stock.sh \
	$(DEVICE)/bootmenu/script/adbd.sh:system/bootmenu/script/adbd.sh \
	$(DEVICE)/bootmenu/script/bootmode_clean.sh:system/bootmenu/script/bootmode_clean.sh \
	$(DEVICE)/bootmenu/script/cdrom.sh:system/bootmenu/script/cdrom.sh \
	$(DEVICE)/bootmenu/script/data.sh:system/bootmenu/script/data.sh \
	$(DEVICE)/bootmenu/script/overclock.sh:system/bootmenu/script/overclock.sh \
	$(DEVICE)/bootmenu/script/post_bootmenu.sh:system/bootmenu/script/post_bootmenu.sh \
	$(DEVICE)/bootmenu/script/pre_bootmenu.sh:system/bootmenu/script/pre_bootmenu.sh \
	$(DEVICE)/bootmenu/script/reboot_command.sh:system/bootmenu/script/reboot_command.sh \
	$(DEVICE)/bootmenu/script/recovery.sh:system/bootmenu/script/recovery.sh \
	$(DEVICE)/bootmenu/script/recovery_stable.sh:system/bootmenu/script/recovery_stable.sh \
	$(DEVICE)/bootmenu/script/recoveryexit.sh:system/bootmenu/script/recoveryexit.sh \
	$(DEVICE)/bootmenu/script/sdcard.sh:system/bootmenu/script/sdcard.sh \
	$(DEVICE)/bootmenu/script/system.sh:system/bootmenu/script/system.sh \
	$(DEVICE)/bootmenu/script/media_fixup.sh:system/bootmenu/script/media_fixup.sh 

#end of jordan-blobs.mk
