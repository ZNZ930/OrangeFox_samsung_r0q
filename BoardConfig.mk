#
# Copyright (C) 2022 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Bootloader
BOARD_VENDOR := samsung
TARGET_SOC := taro
TARGET_BOOTLOADER_BOARD_NAME := taro
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_USES_UEFI := true

ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

ALLOW_MISSING_DEPENDENCIES := true

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := taro
TARGET_BOARD_PLATFORM_GPU := qcom-adreno730
QCOM_BOARD_PLATFORMS += taro

# Kernel
TARGET_PREBUILT_KERNEL := device/samsung/r0q/prebuilt/kernel
TARGET_PREBUILT_DTB := device/samsung/r0q/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := device/samsung/r0q/prebuilt/recovery_dtbo
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_KERNEL_ARCH := arm64

# Boot
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := video=vfb:640x400,bpp=32,memsize=3072000 printk.devkmsg=on firmware_class.path=/vendor/firmware_mnt/image console=null bootconfig androidboot.hardware=qcom hardware=qcom androidboot.memcg=1 androidboot.usbcontroller=a600000.dwc3 androidboot.init_fatal_panic=true androidboot.selinux=permissive loop.max_part=7
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_SECOND_OFFSET := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x01e00000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) 
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION) --pagesize $(BOARD_KERNEL_PAGESIZE) --board "SRPUH24D002"
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB) --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/r0q/bootimg.mk

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 12058624000
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 12054429696
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext odm product vendor vendor_dlkm

# System as root
BOARD_ROOT_EXTRA_FOLDERS := cache carrier data_mirror efs linkerconfig odm_dlkm oem optics postinstall prism second_stage_resources spu system_ext vendor_dlkm
BOARD_SUPPRESS_SECURE_ERASE := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_COPY_OUT_VENDOR := vendor

AB_OTA_UPDATER := false

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 2

# Crypto
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

PLATFORM_VERSION := 12

TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
TW_INCLUDE_FBE_METADATA_DECRYPT := false
BOARD_USES_METADATA_PARTITION := true

# PRODUCT_COPY_FILES directives.
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true

# TWRP specific build flags
ifeq ($(TW_DEVICE_VERSION),)
TW_DEVICE_VERSION=12.0
endif
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone50/temp
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 612
TW_DEFAULT_BRIGHTNESS := 255
TW_Y_OFFSET := 100
TW_H_OFFSET := -100
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TW_USE_NEW_MINADBD := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USE_TOOLBOX := true
TARGET_USES_MKE2FS := true
TW_EXTRA_LANGUAGES := true
TW_NO_LEGACY_PROPS := true
TWRP_INCLUDE_LOGCAT := true
TW_NO_BIND_SYSTEM := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_BACKUP_EXCLUSIONS := /data/fonts
