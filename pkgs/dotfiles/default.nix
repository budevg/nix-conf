{stdenv, bash}:

stdenv.mkDerivation rec {
  name = "dotfiles";
  src = ./.;
  installPhase = ''
    install -dm 755 $out/bin
    install -dm 755 $out/dotfiles
    cp -r $src/files/. $out/dotfiles
    cat << "EOF" > $out/bin/dotfiles_update.sh
    #!${bash}/bin/bash
    for f in `find /home/evgenyb/.nix-profile/dotfiles/ -type f`; do
      DST=$HOME/''${f#*/dotfiles/}
      (set -x; mkdir -p `dirname $DST`; ln -s $f $DST)
    done
    EOF
    chmod +x $out/bin/dotfiles_update.sh
  '';
}
