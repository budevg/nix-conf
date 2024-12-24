{ config, pkgs, ... }:

{
  # printer
  services.printing.enable = true;

  # touchpad
  services.libinput.enable = true;

  # sound
  hardware.pulseaudio.enable = true;
  services.pipewire.enable = false;

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
