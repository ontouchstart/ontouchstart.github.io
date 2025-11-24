# Who is Jim Henson? 
- [YouTube](https://www.youtube.com/watch?v=ThzNQaqgUsM)

main.py
```
     1	from transformers import pipeline
     2	
     3	pipe = pipeline("fill-mask", model="bert-base-uncased")
     4	
     5	text = "Who was Jim Henson ? Jim [MASK] was a puppeteer"
     6	
     7	result = pipe(text)
     8	
     9	print(result[0]['sequence'])
    10	# who was jim henson? jim henson was a puppeteer
    11	
    12	print(result[0]['score'])
    13	
```
```
uv run main.py 
who was jim henson? jim henson was a puppeteer
0.9997103810310364
```
