#
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

#
# This is the product configuration for a generic GSM olympus,
# not specialized for any geography.
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/ktouch/w700/config/init.whistler.rc:root/init.whistler.rc \
    device/ktouch/w700/config/init.rc:root/init.rc \
    device/ktouch/w700/config/ueventd.whistler.rc:root/ueventd.whistler.rc \
    device/ktouch/w700/config/init.ifx.sh:root/init.ifx.sh

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/ktouch/w700/w700-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects

# w700 uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/ktouch/w700/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/ktouch/w700/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_PACKAGES += brcm_patchram_plus \
		    com.android.future.usb.accessory \
		    screencap

DEVICE_PACKAGE_OVERLAYS += device/ktouch/w700/overlay

# Board-specific init
PRODUCT_COPY_FILES += \
    device/ktouch/w700/config/vold.fstab:system/etc/vold.fstab \
    device/ktouch/w700/config/media_profiles.xml:system/etc/media_profiles.xml \
    device/ktouch/w700/config/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/ktouch/w700/config/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := generic_w700
PRODUCT_DEVICE := w700
PRODUCT_MODEL := W700
