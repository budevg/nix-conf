{ config, pkgs, ... }:

let unstable = import <unstable> { };
in {
  home.file = { ".ssh/config".source = ./.ssh/config; };
  home.packages = [
    pkgs.transmission_4-gtk
    pkgs.google-chrome
    pkgs.curl
    pkgs.tcpdump
    pkgs.zoom-us
    pkgs.slack
    pkgs.telegram-desktop
  ];

  programs.firefox = {
    enable = true;

    # about:policies#documentation
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DontCheckDefaultBrowser = true;
    };

    profiles = {
      main = {
        id = 0;
        name = "main";
        # https://kb.mozillazine.org/About:config_entries
        settings = { };
      };
      hack = {
        id = 1;
        name = "hack";
        # https://kb.mozillazine.org/About:config_entries
        settings = {
          "browser.aboutConfig.showWarning" = false;
          "browser.aboutwelcome.didSeeFinalScreen" = true;
          "browser.download.dir" = "${config.home.homeDirectory}/scratch";
          "browser.download.folderList" = 2;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.quitShortcut.disabled" = true;
          "extensions.activeThemeID" = "visionary-bold-colorway@mozilla.org";
          "extensions.pocket.enabled" = false;
          "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
        };
      };
    };
  };
}
