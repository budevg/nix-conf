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
        51877 # wireguard
      ];
      # wireguard rpfilter workaround
      extraCommands = ''
        ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51877 -j RETURN
        ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51877 -j RETURN
      '';
      extraStopCommands = ''
        ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 51877 -j RETURN || true
        ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 51877 -j RETURN || true
      '';
    };
  };

  # wifi firmware
  hardware.enableRedistributableFirmware = true;

  # services.openssh = {
  #   enable = true;
  #   permitRootLogin = "yes";
  # };
}
