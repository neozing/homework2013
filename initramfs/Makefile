# kernel makefile

ifeq ($(TOP),)
include ../config.local
endif

COMS += initramfs

.PHONY: initramfs
initramfs: $(OUT_TARGET_FS_BOOT)/initramfs.img

$(OUT_TARGET_INITRAMFS)/init:
	@mkdir -p $(OUT_TARGET_INITRAMFS)
	@(cd $(OUT_TARGET_INITRAMFS) && mkdir -p proc sys newroot lib)
	@install $(INITRAMFS)/init $@

$(OUT_TARGET_FS_BOOT)/initramfs.img:
	@(cd $(OUT_TARGET_INITRAMFS) && find ./ | cpio -o -H newc | gzip > $@)

clean-initramfs:
	@echo $@

include $(TOP)/common-end.mk
