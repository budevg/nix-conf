{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.vlc
    pkgs.simplescreenrecorder
    pkgs.feh
    pkgs.unrar
    pkgs.unzip
    pkgs.zip
    pkgs.ghostscript
    pkgs.poppler_utils
    pkgs.evince
  ];
}
