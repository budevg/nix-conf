{ config, pkgs, ... }:

{
  services.logind.lidSwitch = "ignore";
  # services.xserver.displayManager.lightdm.extraConfig = ''
  #   display-setup-script=xrandr --output eDP-1 --auto --output DP-1-2-8 --primary --right-of eDP-1 --auto
  # '';
}
