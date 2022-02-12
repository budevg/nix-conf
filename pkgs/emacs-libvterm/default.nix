{ pkgs ? import <nixpkgs> { } }:
with pkgs;
stdenv.mkDerivation {
  name = "emacs-libvterm";

  src = fetchFromGitHub {
    owner = "akermu";
    repo = "emacs-libvterm";
    rev = "a940dd2ee8a82684860e320c0f6d5e15d31d916f";
    sha256 = "0r1iz92sn2ddi11arr9s8z7cdpjli7pn55yhaswvp4sdch7chb5r";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ libvterm-neovim ];

  installPhase = ''
    install -d $out/share/emacs/site-lisp
    install ../*.so $out/share/emacs/site-lisp
  '';
}
