{ pkgs ? import <nixpkgs> {}
}:
with pkgs;
stdenv.mkDerivation {
  name = "emacs-build";
  buildInputs = [
    autoconf automake gcc pkgconfig
    gtk3-x11 xlibsWrapper xorg.libXaw xorg.libXpm xorg.libXft Xaw3d
    libpng libjpeg libungif libtiff librsvg libxml2
    gnutls ncurses imagemagick cairo lcms2 gpm dbus libselinux
    m17n_lib libotf acl systemd jansson libgccjit
  ];
  LIBRARY_PATH = "${lib.getLib stdenv.cc.libc}/lib";
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
