{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  libGccJitLibraryPaths = [
    "${pkgs.lib.getLib pkgs.libgccjit}/lib/gcc"
    "${pkgs.lib.getLib pkgs.stdenv.cc.libc}/lib"
    "${pkgs.lib.getLib pkgs.stdenv.cc.cc.libgcc}/lib"
  ];
in stdenv.mkDerivation {
  name = "emacs-build";

  buildInputs = [
    acl
    autoconf
    automake
    cairo
    dbus
    gcc
    gnutls
    gpm
    gtk3-x11
    imagemagick
    jansson
    lcms2
    libgccjit
    libjpeg
    libotf
    libpng
    librsvg
    libselinux
    libtiff
    libungif
    libxml2
    m17n_lib
    ncurses
    pkgconfig
    sqlite
    systemd
    tree-sitter
    Xaw3d
    xorg.libXaw
    xorg.libXft
    xorg.libXpm
  ];

  LIBRARY_PATH = lib.concatStringsSep ":" libGccJitLibraryPaths;

  shellHook = ''
    function compile-emacs-native {
      ./autogen.sh && \
      mkdir -p .build && \
      cd .build &&  \
      ../configure --with-native-compilation && \
      time make NATIVE_FULL_AOT=1 $@
    }
  '';
}
