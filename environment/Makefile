env:
	cat /etc/os-release | cat -n
	apt list --installed 2>/dev/null | grep installed | cat -n
	set | grep -v TOKEN | cat -n
	env | grep -v TOKEN | cat -n
	set | grep TOKEN | cut -f1 -d= | cat -n
	env | grep TOKEN | cut -f1 -d= | cat -n
	make -C python
	make -C node
	make -C docker
