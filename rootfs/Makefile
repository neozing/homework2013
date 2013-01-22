# kernel makefile

ifeq ($(TOP),)
include ../config.local
endif

COMS += rootfs

.PHONY: rootfs
rootfs:
	@(cd $(OUT_TARGET_ROOTFS); mkdir -p lib sys proc dev etc/init.d)
	@install $(ROOTFS)/etc/profile $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/inittab $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/fstab $(OUT_TARGET_ROOTFS)/etc
	@install $(ROOTFS)/etc/init.d/rcS $(OUT_TARGET_ROOTFS)/etc/init.d

clean-rootfs:
	@echo $@

include $(TOP)/common-end.mk
