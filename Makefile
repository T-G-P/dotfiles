# A basic installation 
all: install

install:
	ln -sf $(CURDIR)/vimrc $(HOME)/.vimrc 
	ln -sf $(CURDIR)/zshrc $(HOME)/.zshrc
	ln -sf $(CURDIR)/tmux.conf $(HOME)/.tmux.conf 
