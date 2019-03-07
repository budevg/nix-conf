{ config, pkgs, ... }:

{
  time.timeZone = "Asia/Jerusalem";

  environment.systemPackages = with pkgs; [
    wget vim git bash axel stack python tightvnc

    trayer networkmanagerapplet polkit_gnome
    xdg-user-dirs xcompmgr synapse
    greybird elementary-xfce-icon-theme
    xorg.setxkbmap libnotify xfce.dconf vanilla-dmz

    gcc automake autoconf gnumake
    ntfs3g
  ];

  programs.slock.enable = true;

}