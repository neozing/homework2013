# main makefile

include config.local

.PHONY: all everything test out
.PHONY: clean-test clean-out

all: everything

COMS := out
CLEAN_OUT_REAL = clean-out-real

# include in build order
include kernel/makefile

everything: $(COMS)
	@echo $@

test:

clean-test:

out:
	@echo $@
	@mkdir -p $(OUT)

clean-out:

include $(TOP)/common-end.mk

clean-out-real:
	@echo $@
	@rm -rf $(OUT)

