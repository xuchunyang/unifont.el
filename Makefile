EMACS ?= emacs

all: compile buttercup

dep:
	@test -d buttercup-1.16 || (\
	wget 'https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/buttercup-1.16.tar' && \
	tar xvf buttercup-1.16.tar )

compile: dep
	${EMACS} -Q --batch -L buttercup-1.16 -f batch-byte-compile buttercup-1.16/*.el
	${EMACS} -Q --batch -L . --eval "(setq byte-compile-error-on-warn t)" -f batch-byte-compile unifont.el

buttercup: dep
	${EMACS} -Q --batch -L . -L buttercup-1.16 -l buttercup -f buttercup-run-discover

xuchunyang: dep
	@for cmd in emacs-25.1 emacs-25.3 emacs-26.1 emacs-26.2; do \
	    command -v $$cmd && make EMACS=$$cmd ;\
	done
