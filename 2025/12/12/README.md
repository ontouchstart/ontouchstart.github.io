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
<IPython.terminal.interactiveshell.TerminalInteractiveShell object at 0x107c75160>
```
