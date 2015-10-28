
# Apns
ifneq ($(filter aosip_shamu aosip_hammerhead aosip_mako,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/addon.d/50-base.sh:system/addon.d/50-base.sh \
    vendor/aosip/prebuilt/common/addon.d/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/aosip/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/aosip/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/aosip/prebuilt/common/etc/backup.conf:system/etc/backup.conf

#Root by default
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1

#extras
PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/aosip/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

    # init.d script support
PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/bin/sysinit:system/bin/sysinit

# Inherit common product build prop overrides
-include vendor/aosip/products/common_versions.mk
