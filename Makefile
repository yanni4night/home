usage:
	@echo 'Usage: make install|uninstall'
install:
	@sh install.sh
	@source ~/.bash_profile
	@echo 'install complete'
uninstall:
	@sh uninstall.sh
	@source ~/.bash_profile
	@echo 'uninstall complete'