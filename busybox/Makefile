# kernel makefile

ifeq ($(TOP),)
include ../config.local
endif

COMS += busybox

.PHONY: busybox
busybox: real-busybox

BB_BZ2=busybox-1.20.2.tar.bz2
BB_URL=http://www.busybox.net/downloads/$(BB_BZ2)
BB_TARBALL=$(TARBALLS)/$(BB_BZ2)

$(BB_TARBALL):
	@echo "Downloading busybox ... "
	@wget -P $(TARBALLS) $(BB_URL)

$(OUT_BUSYBOX)/Makefile: $(BB_TARBALL)
	@echo "Unpacking busybox ... "
	@mkdir -p $(OUT_BUSYBOX)
	@tar xjf $(BB_TARBALL) --strip-components 1 -C $(OUT_BUSYBOX)

.PHONY: real-busybox
real-busybox: $(OUT_BUSYBOX)/Makefile
	@make -C $(OUT_BUSYBOX) defconfig
	@sed -e 's/.*STATIC.*/CONFIG_STATIC=y/' -i $(OUT_BUSYBOX)/.config
	@mkdir -p $(OUT_TARGET_INITRAMFS) $(OUT_TARGET_ROOTFS)
	@make -C $(OUT_BUSYBOX) CONFIG_PREFIX=$(OUT_TARGET_INITRAMFS) install
	@make -C $(OUT_BUSYBOX) CONFIG_PREFIX=$(OUT_TARGET_ROOTFS) install
	@echo $@

clean-busybox:
	@echo $@

include $(TOP)/common-end.mk
