# A basic installation 
all: install

install:
	ln -s vimrc $HOME/.vimrc 
	ln -s zshrc $HOME/.zshrc
	ln -s tmux.conf $HOME/.tmux.conf 

update:
	ln -s vimrc $HOME/.vimrc 
	ln -s tmux.conf $HOME/.tmux.conf 

