
-include config.mk

COMPAT_DIR ?= /dev/null
DASH_DIR ?= /dev/null
WITH_EDITOR_DIR ?= /dev/null
TRANSIENT_DIR ?= /dev/null
MAGIT_DIR ?= /dev/null

LOAD_PATH = -L $(COMPAT_DIR) -L $(DASH_DIR) -L $(WITH_EDITOR_DIR) \
	    -L $(TRANSIENT_DIR) -L $(MAGIT_DIR)
BATCH = emacs -Q --batch $(LOAD_PATH)

all: magit-tbdiff.elc magit-tbdiff-autoloads.el

.PHONY: clean
clean:
	$(RM) *.elc magit-tbdiff-autoloads.el

%.elc: %.el
	@$(BATCH) -f batch-byte-compile $<

%-autoloads.el: %.el
	@$(BATCH) --eval \
	"(let ((make-backup-files nil)) \
	   (if (fboundp 'loaddefs-generate) \
	       (loaddefs-generate default-directory \"$@\") \
	     (update-file-autoloads \"$(CURDIR)/$<\" t \"$(CURDIR)/$@\")))"
