{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.dool
    pkgs.file
    pkgs.htop
    pkgs.inotify-tools
    pkgs.lsof
    pkgs.ncdu
    pkgs.pciutils
    pkgs.psmisc
    pkgs.strace
    pkgs.pavucontrol
    pkgs.smartmontools
    pkgs.system-config-printer
  ];
}
