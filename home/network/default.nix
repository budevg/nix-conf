{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.transmission-gtk
    pkgs.google-chrome
    pkgs.firefox
    pkgs.curl
    pkgs.tcpdump
  ];
}
