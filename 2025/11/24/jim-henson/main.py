from transformers import pipeline

pipe = pipeline("fill-mask", model="bert-base-uncased")

text = "Who was Jim Henson ? Jim [MASK] was a puppeteer"

result = pipe(text)

print(result[0]['sequence'])
# who was jim henson? jim henson was a puppeteer

print(result[0]['score'])

