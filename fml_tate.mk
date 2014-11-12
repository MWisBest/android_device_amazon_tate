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

# Inherit some common FML stuff.
$(call inherit-product, vendor/fml/config/common.mk)

# Inherit device configuration for bowser
$(call inherit-product, device/amazon/tate/full_tate.mk)
$(call inherit-product, device/amazon/bowser-common/fml_bowser-common.mk)

PRODUCT_NAME := fml_tate
PRODUCT_RELEASE_NAME := KindleFireHD

