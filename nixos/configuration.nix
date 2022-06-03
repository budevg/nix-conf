{ config, pkgs, ... }:

{
  imports = [
    ./desktop.nix
    ./devices.nix
    ./env.nix
    ./grub.nix
    ./hardware-configuration.nix
    ./network.nix
    ./system.nix
    ./users.nix
    ./laptop.nix
  ];

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "18.09";
}
