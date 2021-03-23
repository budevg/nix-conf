{ config, pkgs, ... }:

{
  home.file = {
    ".ssh/config".source = ./.ssh/config;
  };
  home.packages = [
    pkgs.transmission-gtk
    pkgs.google-chrome
    pkgs.firefox
    pkgs.curl
    pkgs.tcpdump
  ];
}
