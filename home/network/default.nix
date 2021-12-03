{ config, pkgs, ... }:

let unstable = import <unstable> { };
in {
  home.file = { ".ssh/config".source = ./.ssh/config; };
  home.packages = [
    pkgs.transmission-gtk
    pkgs.google-chrome
    pkgs.firefox
    pkgs.curl
    pkgs.tcpdump
    unstable.slack
  ];
}
