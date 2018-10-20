{ pkgs ? import <nixpkgs> {}
}:
with pkgs;
stdenv.mkDerivation {
  name = "xmonad-build";
  buildInputs = [
    pkgconfig
    autoconf
    gcc
    xorg.libX11
    xorg.libXext
    xorg.libXft
    xorg.libXinerama
    xorg.libXpm
    xorg.libXrandr
    xorg.libXrender
    xorg.libXScrnSaver
  ];
}
