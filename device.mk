# Copyright (C) 2013 The CyanogenMod Project
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

DEVICE_FOLDER := device/amazon/tate
TARGET_BOOTLOADER_BOARD_SUBTYPE := tate

$(call inherit-product, device/amazon/bowser-common/common.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

# Rootfs
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/fstab.tate:/root/fstab.bowser \
    $(DEVICE_FOLDER)/init.bowser.rc:root/init.bowser.rc \
    $(DEVICE_FOLDER)/init.bowser.usb.rc:root/init.bowser.usb.rc \
    $(DEVICE_FOLDER)/init.recovery.bowser.rc:root/init.recovery.bowser.rc \
    $(DEVICE_FOLDER)/ueventd.bowser.rc:root/ueventd.bowser.rc

# Device settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=213 \
    persist.hwc.mirroring.region=0:0:800:1280 \
    persist.hwc.mirroring.transform=3 \
    omap.audio.mic.main=DMic0L \
    omap.audio.mic.sub=DMic0R \
    sys.usb.vid=1949 \
    sys.usb.pid=0007 \
    usb.vendor=1949 \
    usb.product.adb=0007 \
    usb.product.mtpadb=0007 \
    ro.cwm.forbid_format=/bootloader,/xloader,/misc

# Set dirty regions off
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=false

# RIL turn off
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=1 \
    ro.radio.use-ppp=no \
    ro.config.nocheckin=yes \
    ro.radio.noril=yes

# wifi-only device
PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only

$(call inherit-product-if-exists, vendor/amazon/tate/tate-vendor.mk)
$(call inherit-product-if-exists, vendor/amazon/omap4-common/omap4-common-vendor-4460.mk)
