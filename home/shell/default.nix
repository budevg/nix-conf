{ config, pkgs, ... }:

{
  home.file = {
    ".profile".source = ./.profile;
    ".bashrc".source = ./.bashrc;
    ".dircolors".source = ./.dircolors;
  };
}
