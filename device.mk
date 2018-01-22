#
# Copyright (C) 2020 The LineageOS Project
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

LOCAL_PATH := device/samsung/zerofltexx

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# AAPT
# This device is 640dpi.  However the platform doesn't
# currently contain all of the bitmaps at 640dpi density so
# we do this little trick to fall back to the xxhdpi version
# if the 640dpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 640dpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_0.xml

# Camera-Shim
PRODUCT_PACKAGES += \
	libexynoscamera_shim

# HIDL Manifest
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from universal7420-common
$(call inherit-product, device/samsung/universal7420-common/device-common.mk)

# IR
PRODUCT_PACKAGES += \
	android.hardware.ir@1.0-impl \
	android.hardware.ir@1.0-service

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.samsungexynos7420 \
	init.baseband.rc \
	init.gps.rc \
	init.zerofltexx.rc \
	ueventd.samsungexynos7420.rc

# Sensors
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/sensors/gps.xml:system/etc/gps.xml \
	$(LOCAL_PATH)/configs/sensors/lhd.conf:system/etc/lhd.conf

# Call the proprietary
$(call inherit-product, vendor/samsung/zerofltexx/zerofltexx-vendor.mk)
