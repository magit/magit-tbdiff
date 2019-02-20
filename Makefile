
-include config.mk

DASH_DIR ?= /dev/null
GHUB_DIR ?= /dev/null
GRAPHQL_DIR ?= /dev/null
TREEPY_DIR ?= /dev/null
WITH_EDITOR_DIR ?= /dev/null
LV_DIR ?= /dev/null
TRANSIENT_DIR ?= /dev/null
MAGIT_DIR ?= /dev/null

LOAD_PATH = -L $(DASH_DIR) -L $(WITH_EDITOR_DIR) -L $(GHUB_DIR) \
	    -L $(GRAPHQL_DIR) -L $(TREEPY_DIR) \
	    -L $(LV_DIR) -L $(TRANSIENT_DIR) -L $(MAGIT_POPUP_DIR) -L $(MAGIT_DIR)
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
	  (update-file-autoloads \"$(CURDIR)/$<\" t \"$(CURDIR)/$@\"))"
