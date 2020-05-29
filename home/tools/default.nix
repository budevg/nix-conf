{ config, pkgs, ... }:

with pkgs;
let
  misc-utils = stdenv.mkDerivation rec {
    name = "misc-utils";
    src = ./.;
    phases = [ "installPhase" ];
    installPhase = ''
      install -dm 755 $out/bin
      install $src/misc-utils/*.sh $out/bin
    '';
  };
in {
  home.packages = [
    misc-utils
  ];
}
