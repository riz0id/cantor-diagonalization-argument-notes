{ pkgs ? (import <nixpkgs> { }) }:

let
  gitignoreSource = import ./nix/lib/gitignore-source.nix {
    inherit pkgs;
  };

in pkgs.stdenv.mkDerivation {
  name = "math-notes";

  src = gitignoreSource ./.;

  buildInputs = [
    (import ./nix/latex.nix { inherit pkgs; }).env
  ];

  buildPhase = ''
    mkdir $out
    latexmk -verbose -pdf \
      -pdflatex="pdflatex -interaction=nonstopmode -halt-on-error -shell-escape"\
      slide.tex
  '';

  installPhase = ''
    cp main.pdf $out/main.pdf
  '';
}