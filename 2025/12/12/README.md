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
<IPython.terminal.interactiveshell.TerminalInteractiveShell object at 0x1075bd160>
```
```
% uv run mermaid.py
```
[gist](https://gist.github.com/ca9e1e33eb03d54a4bc229895fac2c58)
```
% uv run math.py
```
[gist](https://gist.github.com/1262d22d7c7b16b41e541a48c20d0fde)
