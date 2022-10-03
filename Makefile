all:
	cat -n /etc/os-release 
	dpkg --list --no-pager 

pyodide-pyodide:
	git clone https://github.com/ontouchstart/pyodide-pyodide.git

clean:
	rm -rf pyodide-pyodide
