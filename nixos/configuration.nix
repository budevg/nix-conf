{ config, pkgs, ... }:

{
  imports =
    [
      ./desktop.nix
      ./devices.nix
      ./grub.nix
      ./hardware-configuration.nix
      ./network.nix
      ./system.nix
      ./users.nix
    ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "18.09";
}
