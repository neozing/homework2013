# kernel makefile

ifeq ($(TOP),)
include ../../config.local
endif

COMS += grub

.PHONY: grub
grub: real-grub

GRUB_GZ=grub-1.99.tar.gz
GRUB_URL=ftp://ftp.gnu.org/gnu/grub/$(GRUB_GZ)
GRUB_TARBALL=$(TARBALLS)/$(GRUB_GZ)

$(GRUB_TARBALL):
	@echo "Downloading grub ... "
	@wget -P $(TARBALLS) $(GRUB_URL)

$(OUT_BOOTLOADER)/Makefile: $(GRUB_TARBALL)
	@echo "Unpacking grub ... "
	@mkdir -p $(OUT_BOOTLOADER)
	@tar xf $(GRUB_TARBALL) --strip-components 1 -C $(OUT_BOOTLOADER)

.PHONY: real-grub
real-grub: $(OUT_BOOTLOADER)/Makefile
	@(cd $(OUT_BOOTLOADER)/; ./configure --prefix=$(OUT_TARGET_BOOT_INSTALL))
	@make -C $(OUT_BOOTLOADER)
	@make -C $(OUT_BOOTLOADER) install
	@echo $@

clean-grub:
	@echo $@

include $(TOP)/common-end.mk
