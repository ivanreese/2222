# Two.lean

Using [lean4](https://github.com/leanprover/lean4), run with:

```
gcc -shared native.c -fPIC -o native.o && lean --run Two.lean --load-dynlib=./native.o
```
