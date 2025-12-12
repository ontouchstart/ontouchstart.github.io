# 2025/12/12
```
main.py
     1	def main():
     2	    print("Hello from 12!")
     3	
     4	
     5	def iPython():
     6	    try:
     7	        print(get_ipython())
     8	    except NameError:
     9	        print("Not in iPython ")
    10	
    11	
    12	if __name__ == "__main__":
    13	    main()
    14	    iPython()
% uv run main.py
Hello from 12!
Not in iPython 
% uv run ipython main.py
Hello from 12!
<IPython.terminal.interactiveshell.TerminalInteractiveShell object at 0x109ebd160>
```
```
% uv run mermaid.py
```
[gist](https://gist.github.com/2467c4b709cefeebc8e4fac8d7b014db)
```
% uv run math.py
```
[gist](https://gist.github.com/4569434d2453e4deb7a96b315d6f4d30)
```
% uv run history-of-LLM.py
```
[gist](https://gist.github.com/9d157d6c713121fd3d60f0023516baf9)
