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
	$(DEVICE)/prebuilt/usr/keypad.kl:system/usr/keylayout/umts_shadow-keypad.kl \
	$(DEVICE)/prebuilt/usr/cpcap-key.kl:system/usr/keylayout/cpcap-key.kl \
	$(DEVICE)/prebuilt/usr/keychars/cpcap-key.kcm:system/usr/keychars/cpcap-key.kcm \

#etc
PRODUCT_COPY_FILES += \
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

#end of shadow-blobs.mk
