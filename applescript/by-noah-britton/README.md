# 2222 in AppleScript (with a lil help from bash)

Contributed by Noah Britton ([@ncb@mas.to](https://mas.to/@ncb))

To play this version:
1. Get a word list, like `2222.txt` from the root of the repo.
2. `cd` to the folder with the word list.
3. Copy paste any of the following into your terminal:

#### Just bash 🥱
```bash
cat 2222.txt | while read line; do
  clear;
  echo $line | fmt -c -w $(tput cols);
  sleep 0.6039604;
done
```

#### AppleScript notifications 🔔
Note that the notifications can't quite keep up with the time, and any queued notifications will continue to appear after you stop the script.

```bash
cat 2222.txt | while read line; do
  osascript -e "display notification \"2222\" with title \"$line\"";
  sleep 0.6039604;
done
```

#### AppleScript alerts 🚨
Note that to stop this one, you've gotta tab over, then hit `control-c`

```bash
cat 2222.txt | while read line; do
  osascript -e "display alert \"$line\"";
  sleep 0.6039604;
done
```
