#
# Copyright (C) 2016 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/zero-common

BOARD_VENDOR := samsung

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_NR_CPUS := 8

# Audio
AUDIOSERVER_MULTILIB := 32
TARGET_AUDIOHAL_VARIANT := samsung

# Binder
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(LOCAL_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_SAMSUNG_BLUETOOTH := true

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := universal7420
TARGET_NO_BOOTLOADER := true

# Charger
WITH_LINEAGE_CHARGER := false
BACKLIGHT_PATH := /sys/devices/13900000.dsim/backlight/panel/brightness
BOARD_BATTERY_DEVICE_NAME := battery
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"

#
# DEX pre-optimizations
#
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
WITH_DEXPREOPT := true

# Extended Filesystem Support
TARGET_EXFAT_DRIVER := sdfat

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Camera
BOARD_USE_SAMSUNG_CAMERAFORMAT_NV21 := true
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_parameters_zero


# Camera-shims
TARGET_LD_SHIM_LIBS += \
	/system/lib/libexynoscamera.so|/vendor/lib/libexynoscamera_shim.so \
	/system/lib64/libexynoscamera.so|/vendor/lib64/libexynoscamera_shim.so

# Fingerprint
TARGET_SEC_FP_CALL_NOTIFY_ON_CANCEL := true
TARGET_SEC_FP_USES_PERCENTAGE_SAMPLES := true
TARGET_SEC_FP_CALL_CANCEL_ON_ENROLL_COMPLETION := true

# Fingerprint-shims
TARGET_LD_SHIM_LIBS += \
	/system/lib64/libbauthserver.so|/vendor/lib64/libbauthtzcommon_shim.so

# Graphics
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_USES_VIRTUAL_DISPLAY := true

# Gralloc
TARGET_USES_GRALLOC1_ADAPTER := true

# (G)SCALER
BOARD_USES_SCALER := true
BOARD_USES_DT := true

## ION
TARGET_USES_ION := true

##
## Samsung LSI Graphics
##
### Buffers
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_NON_CACHED_GRAPHICBUFFER := true

#
# Hardware Classes
#
## LineageOS HW
JAVA_SOURCE_OVERLAYS := \
    org.lineageos.hardware|hardware/samsung/lineagehw|**/*.java \
    org.lineageos.hardware|device/samsung/zero-common/lineagehw|**/*.java

# H/W composer
BOARD_USES_PREBUILT_HWCOMPOSER := true

# HWCServices
BOARD_USES_HWC_SERVICES := false

# Renderscript
BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a53.a57
BOARD_OVERRIDE_RS_CPU_VARIANT_64 := cortex-a57

# Releasetools - for resizing system filesystem
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/zero-common/releasetools

# HDMI
BOARD_HDMI_INCAPABLE := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_sec
TARGET_UNIFIED_DEVICE := true

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
BOARD_KERNEL_BASE := 0x10000000
# BOARD_KERNEL_CMDLINE := commandline from boot.img by bootloader
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x10008000 --ramdisk_offset 0x11000000 --tags_offset 0x10000100
TARGET_KERNEL_SOURCE := kernel/samsung/exynos7420
TARGET_LINUX_KERNEL_VERSION := 3.10
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_SEPARATED_DT := true
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos

# Manifest
ifneq (,$(wildcard lineage-sdk/ ))
DEVICE_MANIFEST_FILE += device/samsung/zero-common/manifest.xml
else
DEVICE_MANIFEST_FILE += device/samsung/zero-common/manifest-aosp.xml
endif

#
# Networking
#
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

#
# NFC
BOARD_NFC_HAL_SUFFIX := universal7420

# Samsung LSI OpenMAX
BOARD_USE_VP8ENC_SUPPORT := true
BOARD_USE_HEVCDEC_SUPPORT := true
BOARD_USE_HEVC_HWIP := false
COMMON_GLOBAL_CFLAGS += -DUSE_NATIVE_SEC_NV12TILED

# Video scaling issue workaround
TARGET_OMX_LEGACY_RESCALING := true

# OpenMAX video
BOARD_USE_DMA_BUF := true
BOARD_USE_METADATABUFFERTYPE := true
# BOARD_USE_STOREMETADATA := true  -- not working due to invalid buffer handles

### Others
BOARD_USE_CSC_HW := false
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_QOS_CTRL := false
BOARD_USE_S3D_SUPPORT := false
BOARD_USES_GSC_VIDEO := true
BOARD_USES_VIRTUAL_DISPLAY := true

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 29360128
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 35651584
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3124019200
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 59183980544 #64GB

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_SOC := exynos7420
TARGET_SLSI_VARIANT := cm

# Radio
BOARD_PROVIDES_LIBRIL := true
SIM_COUNT := 2
ENABLE_VENDOR_RIL_SERVICE := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/ramdisk/fstab.samsungexynos7420.recovery
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_DOWNLOAD_MODE := true

# OpenMAX-shims
zero_shims_omx += \
	/system/lib/omx/libOMX.Exynos.AVC.Decoder.so|/vendor/lib/SHIM_TARGET.so \
	/system/lib64/omx/libOMX.Exynos.AVC.Decoder.so|/vendor/lib64/SHIM_TARGET.so \
	/system/lib/omx/libOMX.Exynos.AVC.Encoder.so|/vendor/lib/SHIM_TARGET.so \
	/system/lib64/omx/libOMX.Exynos.AVC.Encoder.so|/vendor/lib64/SHIM_TARGET.so \
	/system/lib/omx/libOMX.Exynos.HEVC.Decoder.so|/vendor/lib/SHIM_TARGET.so \
	/system/lib64/omx/libOMX.Exynos.HEVC.Decoder.so|/vendor/lib64/SHIM_TARGET.so \
	/system/lib/omx/libOMX.Exynos.HEVC.Encoder.so|/vendor/lib/SHIM_TARGET.so \
	/system/lib64/omx/libOMX.Exynos.HEVC.Encoder.so|/vendor/lib64/SHIM_TARGET.so \
	/system/lib/omx/libOMX.Exynos.MPEG4.Decoder.so|/vendor/lib/SHIM_TARGET.so \
	/system/lib64/omx/libOMX.Exynos.MPEG4.Decoder.so|/vendor/lib64/SHIM_TARGET.so \
	/system/lib/omx/libOMX.Exynos.MPEG4.Encoder.so|/vendor/lib/SHIM_TARGET.so \
	/system/lib64/omx/libOMX.Exynos.MPEG4.Encoder.so|/vendor/lib64/SHIM_TARGET.so \
	/system/lib/omx/libOMX.Exynos.VP8.Decoder.so|/vendor/lib/SHIM_TARGET.so \
	/system/lib64/omx/libOMX.Exynos.VP8.Decoder.so|/vendor/lib64/SHIM_TARGET.so \
	/system/lib/omx/libOMX.Exynos.VP8.Encoder.so|/vendor/lib/SHIM_TARGET.so \
	/system/lib64/omx/libOMX.Exynos.VP8.Encoder.so|/vendor/lib64/SHIM_TARGET.so \
	/system/lib/omx/libOMX.Exynos.VP9.Decoder.so|/vendor/lib/SHIM_TARGET.so \
	/system/lib64/omx/libOMX.Exynos.VP9.Decoder.so|/vendor/lib64/SHIM_TARGET.so \
	/system/lib/omx/libOMX.Exynos.WMV.Decoder.so|/vendor/lib/SHIM_TARGET.so \
	/system/lib64/omx/libOMX.Exynos.WMV.Decoder.so|/vendor/lib64/SHIM_TARGET.so

# Shims: libstagefright
TARGET_LD_SHIM_LIBS +=\
    $(subst SHIM_TARGET,libstagefright_shim,$(zero_shims_omx))

# Shims: libui
TARGET_LD_SHIM_LIBS +=\
    $(subst SHIM_TARGET,libui_shim,$(zero_shims_omx))

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

#
# Security
#
BOARD_USES_TRUST_KEYMASTER := true

# Seccomp filters
BOARD_SECCOMP_POLICY += device/samsung/zero-common/seccomp

# Sepolicy
# BOARD_SEPOLICY_DIRS := $(LOCAL_PATH)/sepolicy

# TWRP
ifneq ($(strip $(wildcard $(TOP)/bootable/recovery/variables.h)),)
-include device/samsung/zero-common/twrp.mk
endif

# WFD
BOARD_USES_WFD := true

# Wifi
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_USE_HIDL          := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_BAND                        := 802_11_ABG

# inherit from the proprietary version
-include vendor/samsung/zero-common/BoardConfigVendor.mk

# inherit from the private proprietary version
-include vendor/samsung/zero-private/BoardConfigVendor.mk
