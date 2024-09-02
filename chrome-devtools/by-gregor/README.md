# 2222 in Chrome DevTools on GitHub

Contributed by [Gregor](https://github.com/Gregoor)

Open a word list on GitHub, e.g. https://github.com/ivanreese/2222/blob/2222/2222.txt

Open the Chrome DevTools console and paste the following
```js
for (const word of document.getElementById('read-only-cursor-text-area').value.split('\n')) {
  document.open()
  document.write(word)
  await new Promise(resolve => setTimeout(resolve, 603.96))
}
```
