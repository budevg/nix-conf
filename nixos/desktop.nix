{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  # services.xserver.videoDrivers = [ "ati_unfree" ];
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.session = [
    { manage = "desktop";
      name = "xmonad";
      start = ''
        .xmonad/scripts/start-xmonad.sh &
        waitPID=$!
      '';
    }
  ];

  fonts.packages = [
    pkgs.noto-fonts
  ];

}
