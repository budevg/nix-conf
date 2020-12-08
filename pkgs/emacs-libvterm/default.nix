{ pkgs ? import <nixpkgs> { } }:
with pkgs;
stdenv.mkDerivation {
  name = "emacs-libvterm";

  src = fetchFromGitHub {
    owner = "akermu";
    repo = "emacs-libvterm";
    rev = "a670b786539d3c8865d8f68fe0c67a2d4afbf1aa";
    sha256 = "0s244crjkbzl2jhp9m4sm1xdhbpxwph0m3jg18livirgajvdz6hn";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ libvterm-neovim ];

  installPhase = ''
    install -d $out/share/emacs/site-lisp
    install ../*.el $out/share/emacs/site-lisp
    install ../*.so $out/share/emacs/site-lisp
  '';
}
