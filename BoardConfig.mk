# Copyright (C) 2009 The Android Open Source Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/motorola/shadow/BoardConfigVendor.mk

USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := false

TARGET_NO_RECOVERY := false
TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_PREINSTALL := true
TARGET_BOOTLOADER_BOARD_NAME := shadow

TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIENT_FPU := neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8
TARGET_OMAP3 := true
COMMON_GLOBAL_CFLAGS += -DTARGET_OMAP3 -DOMAP_COMPAT -DMOTOROLA_UIDS
ARCH_ARM_HAVE_TLS_REGISTER := false

# this is so that we build the Shadow-specific hardware shit
BOARD_GLOBAL_CFLAGS += -DSHADOW_HARDWARE
SHADOW_HARDWARE := true

# Wifi related defines
BOARD_WLAN_DEVICE           := wl1271
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME     := tiwlan_drv
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/fw_wlan1271.bin"
WIFI_FIRMWARE_LOADER        := wlan_loader
PRODUCT_WIRELESS_TOOLS      := true
BOARD_SOFTAP_DEVICE         := wl1271
AP_CONFIG_DRIVER_WILINK     := true
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/fw_tiwlan_ap.bin"
WPA_SUPPL_APPROX_USE_RSSI   := true

BOARD_USE_YUV422I_DEFAULT_COLORFORMAT := true
BOARD_EGL_CFG := device/motorola/jordan/egl.cfg
DEFAULT_FB_NUM := 0

BOARD_KERNEL_CMDLINE := console=ttyS2,115200n8 rw mem=498M@0x80C00000 vram=20M omapgpu.vram=0:4M,1:16M,2:16MT init=/init ip=off motobldlabel=none mmcparts=mmcblk1:p1(mbmloader),p2(mbm),p3(mbmbackup),p4(ebr),p5(bploader),p6(cdt.bin),p7(pds),p8(lbl),p9(lbl_backup),p10(logo.bin),p11(sp),p12(devtree),p13(devtree_backup),p14(bpsw),p15(boot),p16(recovery),p17(cdrom),p18(misc),p19(cid),p20(kpanic),p21(system),p22(cache),p23(preinstall),p24(userdata)
BOARD_KERNEL_BASE := 0x10000000

BOARD_HAVE_BLUETOOTH := true
BOARD_CUSTOM_BLUEDROID := ../../../device/motorola/shadow/bluedroid.c

BOARD_EGL_CFG := device/motorola/shadow/egl.cfg
BOARD_USE_LEGACY_TOUCHSCREEN := true

HARDWARE_OMX := true
TARGET_USE_OMX_RECOVERY := true
TARGET_USE_OMAP_COMPAT  := true
BUILD_WITH_TI_AUDIO := 1
BUILD_PV_VIDEO_ENCODERS := 1

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x003fffff
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x004fffff
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0edfffff   # limited so we enforce room to grow
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_RECOVERY_IGNORE_BOOTABLES := true
BOARD_HAS_SMALL_RECOVERY := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := false

BOARD_SDCARD_DEVICE_PRIMARY   := /dev/block/mmcblk0p1
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk1p21
BOARD_DATA_DEVICE   := /dev/block/mmcblk1p25

# Reboot mode for reboot menu, but only handle recovery, not bootmenu :(
TARGET_RECOVERY_PRE_COMMAND := "/system/bootmenu/script/reboot_command.sh"
TARGET_RECOVERY_PRE_COMMAND_CLEAR_REASON := true

BOARD_NEVER_UMOUNT_SYSTEM := true
#TARGET_RECOVERY_UI_LIB := librecovery_ui_generic
#TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_generic

TARGET_PREBUILT_KERNEL := device/motorola/shadow/kernel

#TARGET_NO_RECOVERY := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/shadow/kernel

# OMX
HARDWARE_OMX := true
ifdef HARDWARE_OMX
OMX_VENDOR := ti
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
endif

# OMAP
#OMAP_ENHANCEMENT := true
#ifdef OMAP_ENHANCEMENT
#COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4
#endif

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_FM_DEVICE := wl1271
COMMON_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Override cyanogen squisher to customize our update zip package
TARGET_CUSTOM_RELEASETOOL := ./device/motorola/jordan/releasetools/squisher

## ICS specifics

BOARD_USES_OVERLAY := true
#USE_OPENGL_RENDERER := true
#BOARD_USES_HGL := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext3
TARGET_USERIMAGES_USE_EXT4 := false

COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS

ifndef SHADOW_DEV_PHONE
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/motorola/shadow/releasetools/shadow_ota_from_target_files

BOARD_USES_AUDIO_LEGACY := true
BOARD_USE_LEGACY_TOUCHSCREEN := true
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_GPSSHIM := false

#BOARD_HIJACK_LOG_ENABLE := true

# shadow requires the common boot hijack
TARGET_NEEDS_MOTOROLA_HIJACK := true

TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /data/.recovery_mode; sync;"
TARGET_RECOVERY_PRE_COMMAND_CLEAR_REASON := true
endif

BOARD_ALWAYS_INSECURE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_MKE2FS := device/motorola/shadow/mke2fs
BOARD_HAS_SMALL_RECOVERY := true
