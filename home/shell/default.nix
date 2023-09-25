{ config, pkgs, ... }:

{
  home.file = {
    ".profile".source = ./.profile;
    ".bashrc".source = ./.bashrc;
    ".dircolors".source = ./.dircolors;
    ".config/xfce4/terminal/terminalrc".source = ./terminalrc;
  };
  home.packages = [ pkgs.zoxide ];
}
