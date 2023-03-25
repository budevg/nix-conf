{ config, pkgs, ... }:

with pkgs;
let
  kmonad-utils = stdenv.mkDerivation rec {
    name = "kmonad-utils";
    src = ./.;
    phases = [ "installPhase" ];
    installPhase = ''
      install -dm 755 $out/bin
      install $src/kmonad.sh $out/bin
    '';
  };
in {
  home.packages = [ pkgs.kmonad kmonad-utils ];
  home.file.".config/kmonad".source = ./files;
}
