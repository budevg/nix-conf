{ config, pkgs, ... }:

{
  imports = [
    ./rofi
  ];

  home.packages = [
    pkgs.ripgrep
    pkgs.global
  ];
}
