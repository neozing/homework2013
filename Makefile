# main makefile

include config.local

.PHONY: all everything test out
.PHONY: clean-test clean-out

all: everything

COMS := out
CLEAN_OUT_REAL = clean-out-real

# include in build order
include kernel/Makefile

everything: $(COMS)
	@echo $@

test:

clean-test:

out:
	@echo $@
	@mkdir -p $(OUT) $(OUT_TARGET_FS_BOOT) $(OUT_TARGET_IMAGE)

clean-out:

include $(TOP)/common-end.mk

clean-out-real:
	@echo $@
	@rm -rf $(OUT)

