# https://dune.readthedocs.io/en/latest/quick-start.html
all:versions project_name;cd project_name&&dune build&&dune test&&dune exec project_name
versions:uname dune opam ocaml;
uname:;uname -a
dune:;dune --version
opam:;opam --version
ocaml:;ocaml --version

project_name:;dune init proj project_name
clean:;rm -rf project_name
