{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.vlc
    pkgs.mpv
    pkgs.simplescreenrecorder
    pkgs.gromit-mpx
    pkgs.feh
    pkgs.unrar
    pkgs.unzip
    pkgs.zip
    pkgs.ghostscript
    pkgs.poppler_utils
    pkgs.evince
  ];
}
