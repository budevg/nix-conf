{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.extraConfig = "terminal_input console; terminal_output console";

  networking = {
    hostName = "custom-dev";
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

  fonts.fonts = [
    pkgs.noto-fonts
  ];

  # services.openssh = {
  #   enable = true;
  #   permitRootLogin = "yes";
  # };

  users.users.root.initialHashedPassword = "";
  users.users.evgenyb = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    uid = 1000;
    group = "evgenyb";
    password = "123456";
  };
  users.groups.evgenyb = {
    gid = 1000;
  };

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

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.slock.enable = true;

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "18.09";

}
