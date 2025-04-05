{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.vlc
    pkgs.yt-dlp
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

  programs.mpv = {
    enable = true;
    config = {
      keep-open = "yes";
      force-window = "yes";
      volume-max = 300;
    };
  };
}
