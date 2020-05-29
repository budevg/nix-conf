{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.kvm
    pkgs.docker
    pkgs.screen
  ];
}
