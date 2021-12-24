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
    pkgs.libgccjit
  ];

  home.file = {
    "tools/bin/emacs" = {
      text = ''
        #!/bin/bash
        export LIBRARY_PATH="${pkgs.lib.getLib pkgs.stdenv.cc.libc}/lib"
        exec ~/projects/repos/apps/emacs-link/.build/src/emacs -rv $@
      '';
      executable = true;
    };
  };

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
