################################################################################
#
# hifiberry-squeezelite
#
################################################################################

define HIFIBERRY_SQUEEZELITE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/hifiberry-squeezelite/S99squeezelite \
                $(TARGET_DIR)/etc/init.d/S99squeezelite
	mkdir -p $(TARGET_DIR)/var/squeezelite
	echo "HiFiBerry" > $(TARGET_DIR)/var/squeezelite/squeezelite.name
endef

define HIFIBERRY_SQUEEZELITE_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/hifiberry-squeezelite/S99squeezelite \
                $(TARGET_DIR)/etc/init.d/S99squeezelite
endef

define HIFIBERRY_SQUEEZELITE_INSTALL_INIT_SYSTEMD
        $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/hifiberry-squeezelite/squeezelite.service \
                $(TARGET_DIR)/usr/lib/systemd/system/squeezelite.service
        ln -fs ../../../usr/lib/systemd/system/squeezelite.service \
                $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/squeezelite.service
endef

$(eval $(generic-package))