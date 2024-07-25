Requires 2222.txt to be in the current working directory, a cute hacky implementation

To run:
```sh
ocaml -I +unix unix.cma 2222.ml
```

Or, to create a standalone executable:
```sh
ocamlopt -I +unix -o 2222 unix.cmxa 2222.ml
```

You can safely ignore the warning for `bad-module-name`.
