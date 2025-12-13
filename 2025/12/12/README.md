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
<IPython.terminal.interactiveshell.TerminalInteractiveShell object at 0x109551d30>
```
```
% uv run mermaid.py
```
[gist](https://gist.github.com/e65190b485cfdf2a13d7e5c0c2cf82d5)
```
% uv run math.py
```
[gist](https://gist.github.com/e79378752910216a335944422e019efd)
```
% uv run history-of-LLM.py
```
[gist](https://gist.github.com/c6cc53bf4c6b5991b5ad294351ffdc57)
