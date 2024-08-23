# Math Notes

Notes on countable sets, uncountable sets, and Cantor's diagonalization argument.

## Build - via Nix

A nix environment is provisioned via [default.nix](./default.nix) and [shell.nix](./default.nix). If you're building on NixOS or another operating system with Nix installed, then you may compile the LaTeX into a PDF with `nix-build`:

```shell
$ nix-build --no-out-link default.nix
```

If you would like to open a shell with the dependencies necessary to build the LaTeX files in this repository, then you may invoke `nix-shell` at the top-level directory of this repository.

```shell
$ nix-shell
```

## Build - without Nix

You're on your own, good luck.