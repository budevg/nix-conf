{ config, pkgs, ... }:

{
  home.file.".config/rofi".source = ./files;
  home.packages = [ pkgs.rofi ];

}
