{ config, pkgs, ... }:

{
  time.timeZone = "Asia/Jerusalem";

  environment.systemPackages = with pkgs; [
    wget vim git bash axel python3

    trayer networkmanagerapplet polkit_gnome
    xdg-user-dirs xcompmgr
    greybird elementary-xfce-icon-theme
    xorg.setxkbmap libnotify dconf vanilla-dmz

    gcc automake autoconf gnumake
    ntfs3g
  ];

  programs.slock.enable = true;

}
