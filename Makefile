install:
	cp -R .vim* ~/
	cp login.sh ~/
	cp git.sh ~/
	cp gitignore.sh ~/
	cp 2itunes.sh ~/
	cp .ssh/config ~/.ssh/
	cp relay ~/bin/
	chmod u+x ~/bin/relay
	cat .bash_profile >> ~/.bash_profile
	source ~/.bash_profile