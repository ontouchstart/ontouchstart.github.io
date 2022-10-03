all:
	cat -n /etc/os-release 
	dpkg --list --no-pager 

pyodide-pyodide:
	git clone https://github.com/ontouchstart/pyodide-pyodide.git

dev:	pyodide-pyodide
	pyodide-pyodide/run_docker

clean:
	rm -rf pyodide-pyodide
