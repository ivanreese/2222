import time
f = open('2222.txt', 'r')
content = f.read()
words = content.split()
for word in words:
  print (word, "\n")
  time.sleep(0.6039604)
