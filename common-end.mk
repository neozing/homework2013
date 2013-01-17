# common end makefile

ifeq ($(CLEAN_COMS),)
CLEAN_COMS = $(patsubst %,clean-%,$(COMS))

.PHONY: clean
clean: $(CLEAN_COMS) $(CLEAN_OUT_REAL)
	@echo clean

.PHONY: dist-clean
dist-clean: clean
	@echo $@
	@rm -f config.local 2> /dev/null

endif
