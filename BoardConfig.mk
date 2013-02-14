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
-include vendor/ktouch/w700/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := whistler
TARGET_BOARD_PLATFORM := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_CPU_SMP := true
#TARGET_HAVE_TEGRA_ERRATA_657451 := true

TARGET_PREBUILT_KERNEL := device/ktouch/w700/kernel
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_PAGE_SIZE := 0x00000800

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5242880
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 402653184
BOARD_USERDATAIMAGE_PARTITION_SIZE := 134217728
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p9
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/mmcblk0p9

BOARD_VOLD_MAX_PARTITIONS := 8
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_HAS_LARGE_FILESYSTEM := true

BOARD_UMS_LUNFILE := /sys/devices/platform/usb_mass_storage/lun0/file

BOARD_CUSTOM_GRAPHICS := ../../../device/ktouch/w700/recovery/graphics.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/ktouch/w700/recovery/recovery_ui.c
#BOARD_HAS_JANKY_BACKBUFFER := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Graphics
TARGET_OVERLAY_ALWAYS_DETERMINES_FORMAT := true
TARGET_USES_GL_VENDOR_EXTENSIONS := true
TARGET_ELECTRONBEAM_FRAMES := 15
BOARD_USE_SCREENCAP := true

# WiFi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := bcm4325
WIFI_DRIVER_MODULE_PATH	    := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/firmware/fw_bcmwlan_apsta.bin"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/firmware/fw_bcmwlan.bin"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan0 firmware_path=/system/etc/firmware/fw_bcmwlan.bin nvram_path=/system/etc/firmware/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "dhd"
BOARD_WEXT_NO_COMBO_SCAN    := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_NEEDS_CUTILS_LOG := true

#Camera
USE_CAMERA_STUB := false
#BOARD_USE_YUV420P_DEFAULT_COLORFORMAT := true
#TARGET_SPECIFIC_HEADER_PATH := device/ktouch/w700/include

#Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := true
#TARGET_DONT_SET_AUDIO_AAC_FORMAT := true

#EGL
BOARD_EGL_CFG := device/ktouch/w700/config/egl.cfg

#USB Tethering
#BOARD_CUSTOM_USB_CONTROLLER := ../../device/ktouch/w700/UsbController.cpp

TARGET_OTA_ASSERT_DEVICE := w700

