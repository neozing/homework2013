# kernel makefile

ifeq ($(TOP),)
include ../config.local
endif

COMS += kernel

K_BZ2=linux-$(KERNEL_VER).tar.bz2
K_URL=http://www.kernel.org/pub/linux/kernel/v3.0/$(K_BZ2)
K_TARBALL=$(TARBALLS)/$(K_BZ2)

.PHONY: kernel
kernel: $(OUT_KERNEL)/.config
	@make -C $(OUT_KERNEL) -j8 ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE)
	@cat $(OUT_KERNEL)/arch/x86/boot/bzImage > $(OUT_TARGET_FS_BOOT)/vmlinuz
	@echo $@

$(K_TARBALL):
	@echo "Downloading kernel ... $(KERNEL_VER) ..."
	@wget -P $(TARBALLS) $(K_URL)

$(OUT_KERNEL)/Makefile: $(K_TARBALL)
	@echo "Unpacking kernel ... $(KERNEL_VER) ..."
	@mkdir -p $(OUT_KERNEL)
	@tar xjf $(K_TARBALL) --strip-components 1 -C $(OUT_KERNEL)

$(OUT_KERNEL)/.config: $(OUT_KERNEL)/Makefile
	@cp $(KERNEL)/2m_config $(OUT_KERNEL)/.config
	#@make -C $(OUT_KERNEL) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) defconfig

clean-kernel:
	@echo $@

include $(TOP)/common-end.mk
