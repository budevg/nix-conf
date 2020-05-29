{ config, pkgs, ... }:

{
  imports = [
    ./home/media
    ./home/navigate
    ./home/network
    ./home/programming
    ./home/shell
    ./home/system
    ./home/tools
    ./home/virt
  ];
  programs.home-manager.enable = true;
  home.stateVersion = "20.03";
}
