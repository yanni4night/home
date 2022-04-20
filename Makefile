usage:
	@echo 'Usage: make install|uninstall'
install:
	@sh install.sh
	@echo 'install complete, you need to add .my_bash_profile to your bash'
uninstall:
	@sh uninstall.sh
	@echo 'uninstall complete, you need to remove .my_bash_profile from your  bash'