# Generic product
PRODUCT_NAME := AOSIP
PRODUCT_BRAND := AOSIP
PRODUCT_DEVICE := generic

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false
    dalvik.vm.image-dex2oat-filter=everything \
    dalvik.vm.dex2oat-filter=everything
    
# Launcher3
PRODUCT_PACKAGES += \
    Launcher3

# Auto-rotate
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/aosip/overlay/Launcher3

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# STK: overlay common to all devices with telephony
ifneq ($(filter aosip_shamu aosip_hammerhead aosip_mako,$(TARGET_PRODUCT)),)
# Build SimToolKit
PRODUCT_PACKAGES += \
    Stk
endif

# Latin IME lib
PRODUCT_COPY_FILES += \
    vendor/aosip/proprietary/common/system/lib/libjni_latinime.so:system/lib/libjni_latinime.so

#Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aosip/overlay/common

# Inherit common product build prop overrides
-include vendor/aosip/products/common_full.mk
