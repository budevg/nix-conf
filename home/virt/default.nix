{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.qemu_kvm
    pkgs.docker
    pkgs.screen
  ];
}
