# Every pothole has a rabbit hole underneath. 👨🏻‍✈️💻🐇🕳️🐍🦀🤔
```python
     1	# main.py
     2	import this
     3	import subprocess
     4	
     5	print()
     6	print(
     7	    subprocess.run(
     8	        ["system_profiler", "Hardware", "SPDisplaysDataType"],
     9	        capture_output=True,
    10	        text=True,
    11	        check=True,
    12	    ).stdout
    13	)
```
```
sam@Sams-MacBook-Pro ontouchstart.github.io % uv run main.py
The Zen of Python, by Tim Peters

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!

Graphics/Displays:

    Apple M5:

      Chipset Model: Apple M5
      Type: GPU
      Bus: Built-In
      Total Number of Cores: 10
      Vendor: Apple (0x106b)
      Metal Support: Metal 4
      Displays:
        Color LCD:
          Display Type: Built-in Liquid Retina XDR Display
          Resolution: 3024 x 1964 Retina
          Main Display: Yes
          Mirror: Off
          Online: Yes
          Automatically Adjust Brightness: Yes
          Connection Type: Internal


```
