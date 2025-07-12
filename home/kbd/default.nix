{ config, pkgs, ... }:

with pkgs;
let
  kanata-utils = stdenv.mkDerivation rec {
    name = "kanata-utils";
    src = ./.;
    phases = [ "installPhase" ];
    installPhase = ''
      install -dm 755 $out/bin
      install $src/kanata.sh $out/bin
    '';
  };
in {
  home.packages = [ pkgs.kanata kanata-utils ];
  home.file.".config/kanata".source = ./files;
}
