# 2222 in Bash

Contributed by marcink ([@marcink@stolat.town](https://stolat.town/@marcink))

To play this version:
1. Get a word list, like `2222.txt` from the root of the repo.
2. `cd` to the folder with the word list.
3. Copy paste the following into your terminal:

```bash
for word in $(cat 2222.txt); do clear; echo $word; sleep 0.6039604; done
```
