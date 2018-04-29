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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Common Overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/zero-common/overlay

ifneq ($(filter zerofltespr zeroltespr,$(TARGET_DEVICE)),)
DEVICE_PACKAGE_OVERLAYS += device/samsung/zero-common/overlay-cdma
else
DEVICE_PACKAGE_OVERLAYS += device/samsung/zero-common/overlay-gsm
endif

# This device is 640dpi.  However the platform doesn't
# currently contain all of the bitmaps at 640dpi density so
# we do this little trick to fall back to the xxhdpi version
# if the 640dpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 640dpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.ecg.xml:system/etc/permissions/android.hardware.sensor.heartrate.ecg.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:system/etc/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    device/samsung/zero-common/configs/permissions/com.samsung.permission.HRM_EXT.xml:system/etc/permissions/com.samsung.permission.HRM_EXT.xml \
    device/samsung/zero-common/configs/permissions/com.samsung.permission.SSENSOR.xml:system/etc/permissions/com.samsung.permission.SSENSOR.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/mixer_paths_0.xml:system/vendor/etc/mixer_paths_0.xml \
    $(LOCAL_PATH)/configs/mixer_paths_0-audience.xml:system/vendor/etc/mixer_paths_0-audience.xml

PRODUCT_PACKAGES += \
    audio.primary.universal7420 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    tinymix \
    libtinycompress \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service \
	libbt-vendor

# Browser
PRODUCT_PACKAGES += \
    Jelly

# Camera
PRODUCT_PACKAGES += \
    camera.exynos5 \
    libexynoscamera_shim \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.0-impl \
    android.hardware.configstore@1.0-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl

# DTB
PRODUCT_PACKAGES += \
	dtbhtoolExynos

# Doze
PRODUCT_PACKAGES += \
    ZeroDoze

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml \
    $(LOCAL_PATH)/configs/lhd.conf:system/etc/lhd.conf

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprint.exynos5 \
    libbauthtzcommon_shim \
    android.hardware.biometrics.fingerprint@2.1-impl \
    android.hardware.biometrics.fingerprint@2.1-service

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service

# GPS
PRODUCT_PACKAGES += \
    libsensor_shim \
    gps.default

# Graphics
PRODUCT_PACKAGES += \
    gralloc.exynos5 \
    libhwc2on1adapter \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl

# Init
PRORUCT_PACKAGES += \
    libinit_sec

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    $(LOCAL_PATH)/idc/Synaptics_HID_TouchPad.idc:system/usr/idc/Synaptics_HID_TouchPad.idc \
    $(LOCAL_PATH)/idc/ft5x06_ts.idc:system/usr/idc/ft5x06_ts.idc \
    $(LOCAL_PATH)/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Lights
PRODUCT_PACKAGES += \
    lights.universal7420 \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# MDNIE
# PRODUCT_PACKAGES += \
#    AdvancedDisplay

# Memory
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl

# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:system/vendor/etc/media_profiles_V1_0.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    android.hardware.nfc@1.0-impl \
    android.hardware.nfc@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/configs/libnfc-sec-hal.conf:system/etc/libnfc-sec-hal.conf \
    $(LOCAL_PATH)/configs/libnfc-sec.conf:system/etc/libnfc-brcm.conf

# Network
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Power
PRODUCT_PACKAGES += \
    power.universal7420 \
    android.hardware.power@1.0-service \
    android.hardware.power@1.0-impl

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@1.0-service-sdm \
    vendor.lineage.livedisplay-V1.0-java

PRODUCT_BOOT_JARS += \
    vendor.lineage.livedisplay-V1.0-java
	
# OpenMAX-shims
PRODUCT_PACKAGES += \
    libui_shim \
    libExynosOMX_shim

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/android.hardware.media.omx@1.0-service.rc:system/vendor/etc/init/android.hardware.media.omx@1.0-service.rc

# Radio
PRODUCT_PACKAGES += \
	libxml2 \
	libprotobuf-cpp-full \
	libreference-ril \
	libril \
	libsecril-client \
	libsecril-client-sap \
	android.hardware.radio@1.0 \
	android.hardware.radio.deprecated@1.0 \
	modemloader

# Properties 
TARGET_SYSTEM_PROP += device/samsung/zero-common/system.prop
    
# Ramdisk
PRODUCT_PACKAGES += \
    fstab.samsungexynos7420 \
    init.baseband.rc \
    init.gps.rc \
    init.power.rc \
    init.samsungexynos7420.rc \
    init.samsungexynos7420.usb.rc \
    init.wifi.rc \
    ueventd.samsungexynos7420.rc \
    init.carrier.rc \
    init.rilchip.rc \
    init.rilchip.sh \

# cpboot daemon
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ril/sbin/cbd:root/sbin/cbd

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Filesystem tools for resizing system partition filesystem
PRODUCT_PACKAGES += \
	e2fsck_static \
	resize2fs_static

# Samsung
PRODUCT_PACKAGES += \
    HealthService \
    SamsungServiceMode

# seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:system/vendor/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:system/vendor/etc/seccomp_policy/mediaextractor.policy

# Sensorhub
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl

# Stagefright-shims
PRODUCT_PACKAGES += \
	libstagefright_shim

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mediaserver.rc:system/etc/init/mediaserver.rc

# Tools
PRODUCT_PACKAGES += \
	resetprop.zero   # Required for setting ro.*-properties for dual-SIM support

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-impl \
    android.hardware.usb@1.0-service

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    libnetcmdiface \
    libwpa_client \
    macloader \
    wificond \
    wifiloader \
    wifilogd \
    wlutil \
    wpa_supplicant \
    wpa_supplicant.conf \
    android.hardware.wifi@1.0-impl \
    android.hardware.wifi@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/filter_ie:system/etc/wifi/filter_ie

# call Samsung LSI board support package
$(call inherit-product, hardware/samsung_slsi-cm/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi-cm/exynos7420/exynos7420.mk)

# Get private non-open-source blobs
$(call inherit-product-if-exists, vendor/samsung/zero-private/zero-private-vendor.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/zero-common/zero-common-vendor.mk)
