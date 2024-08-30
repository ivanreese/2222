# 2222 in DevTools JS on GitHub

Contributed by [Gregor](https://github.com/Gregoor)

Ppen a word list on GitHub, e.g. https://github.com/ivanreese/2222/blob/2222/2222.txt

Open your devtools' browser console and paste the following
```js
for (const word of document.getElementById('read-only-cursor-text-area').value.split('\n')) {
  document.open()
  document.write(word)
  await new Promise(resolve => setTimeout(resolve, 603.96))
}
```
