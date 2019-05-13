EMACS ?= emacs

all: compile

compile:
	${EMACS} -Q --batch -L . --eval "(setq byte-compile-error-on-warn t)" -f batch-byte-compile unifont.el

xuchunyang:
	@for cmd in emacs-25.1 emacs-25.3 emacs-26.1 emacs-26.2; do \
	    command -v $$cmd && make EMACS=$$cmd ;\
	done
