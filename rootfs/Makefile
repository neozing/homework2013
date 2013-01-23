# kernel makefile

ifeq ($(TOP),)
include ../config.local
endif

COMS += rootfs

.PHONY: rootfs
rootfs:
	@mkdir -p $(OUT_TARGET_ROOTFS)
	@(cd $(OUT_TARGET_ROOTFS); mkdir -p lib sys proc dev etc/init.d home/ubuntu root)
	@install $(ROOTFS)/etc/motd $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/issue $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/hostname $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/passwd $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/shadow $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/group $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/profile $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/inittab $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/fstab $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/init.d/rcS $(OUT_TARGET_ROOTFS)/etc/init.d

clean-rootfs:
	@echo $@

include $(TOP)/common-end.mk
