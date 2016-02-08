#Instalation

	~$ git clone git://bitbucket.org/mgn1993/dotvim.git ~/.vim

	~$ ln -s ~/.vim/vimrc ~/.vimrc
	This isn't necessary, for vim would look for vimrc in .vim directory

	~$ cd ~/.vim
	~/.vim$ git submodule init
	~/.vim$ git submodule update
	This downloads the submodules (i.e. Vundle)

#Issues:
- **vim-easymotion** stops rendering proper colors after sourcing **vimrc** again
- **vim-multiple-cursors** stops working after sourcing **vimrc** again
- **vim-expand-region** conflicts with **vim-fugitive**