# 2222 in awk

Contributed by Eli Mellen ([eli.li](https://eli.li))

To play this version:
1. Get a word list, like `2222.txt` from the root of the repo.
2. Make sure you have awk — if you're on Mac or Linux, it's installed by default.
3. `cd` to the folder with the word list.
4. Copy paste the following into your terminal:

```awk
file="2222.txt"
# read each line from the file and sleep for 0.6039604 seconds
awk '{ system("clear"); print $0; system("sleep 0.6039604") }' "$file"
```

To stop the game (why would you want to do that?) just close the tab :)
