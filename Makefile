all:
	cat -n /etc/os-release 
	dpkg --list --no-pager | grep ^ii | cat -n
