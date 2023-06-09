{ config, pkgs, ... }:

{
  boot.loader.grub.enable = true;

  boot.loader.grub.device = "/dev/sda";
  # enable for uefi
  # boot.loader.grub.device = "nodev";
  # boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.extraConfig = "terminal_input console; terminal_output console";
  # enable for uefi
  # boot.loader.efi.canTouchEfiVariables = true;
}
