all:
	cat -n /etc/os-release | tee os-release.log
	apt list --installed | grep '[installed]' | cat -n | tee apt-list.log
