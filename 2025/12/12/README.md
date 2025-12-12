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
<IPython.terminal.interactiveshell.TerminalInteractiveShell object at 0x10c439160>
```
```
% uv run mermaid.py
```
[gist](https://gist.github.com/fd782e4c1935ec4083c67dd7566157c6)
```
% uv run math.py
```
[gist](https://gist.github.com/36c4d2fb867f47b216cb0b047a057883)
```
% uv run history-of-LLM.py
```
[gist](https://gist.github.com/35fad37c05bf7c0c45a0b4e649a8c569)
