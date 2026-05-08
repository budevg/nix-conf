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

  # disable due to Dirty Falg and Copy Fail exploits
  boot.extraModprobeConfig = ''
    install algif_aead ${pkgs.coreutils}/bin/false
    install esp4 ${pkgs.coreutils}/bin/false
    install esp6 ${pkgs.coreutils}/bin/false
    install rxrpc ${pkgs.coreutils}/bin/false
  '';
  boot.blacklistedKernelModules = [
    "algif_aead"
    "esp4"
    "esp6"
    "rxrpc"
  ];
}
