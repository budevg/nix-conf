{ config, pkgs, ... }:

{
  networking = {
    hostName = "evgenyb-dev";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        8008 8009 # chromecast
      ];
      allowedUDPPorts = [
        1900 5353 # chromecast
      ];
    };
  };

  # wifi firmware
  hardware.enableRedistributableFirmware = true;

  # services.openssh = {
  #   enable = true;
  #   permitRootLogin = "yes";
  # };
}
