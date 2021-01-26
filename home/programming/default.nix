{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.nixfmt
    pkgs.gdb
    pkgs.cloc
    pkgs.meld
    pkgs.pv
    pkgs.jq
    (pkgs.aspellWithDicts (d: [ d.en ]))
    pkgs.gcp
    pkgs.emacs-libvterm
  ];

  programs.git = {
    enable = true;
    userName = "user name";
    userEmail = "user@mail.com";
    aliases = {
      lg =
        "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(magenta)<%an>%Creset' --abbrev-commit --date=relative";
      l = "log --no-merges";
      ll = "log --graph --date=short";
      fp = "format-patch -s";
      fpp = "format-patch -s --cover-letter";
      c = "clean -fdxn";
      cc = "clean -fdx";
    };
    extraConfig = {
      core.pager = "cat";
      rebase.autosquash = true;
    };
  };
}
