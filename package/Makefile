# kernel makefile

ifeq ($(TOP),)
include ../config.local
endif

COMS += package

.PHONY: package
package:
	@$(PACKAGE)/mkqemuimg.sh $(OUT_TARGET_FS_BOOT) $(OUT_TARGET_ROOTFS) $(OUT_TARGET_IMAGE)/quick_eqmu.img $(OUT_TARGET_BOOT_INSTALL) $(IMAGE_SIZE)

clean-package:
	@echo $@

include $(TOP)/common-end.mk
