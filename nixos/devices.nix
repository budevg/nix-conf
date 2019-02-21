{ config, pkgs, ... }:

{
  # printer
  services.printing.enable = true;

  # touchpad
  services.xserver.libinput.enable = true;

  # sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
}
