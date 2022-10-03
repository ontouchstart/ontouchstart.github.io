all:
	cat -n /etc/os-release 
	apt list --installed | grep '[installed]' | cat -n 
