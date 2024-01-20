{ config, pkgs, ... }:

let
  libGccJitLibraryPaths = [
    "${pkgs.lib.getLib pkgs.libgccjit}/lib/gcc"
    "${pkgs.lib.getLib pkgs.stdenv.cc.libc}/lib"
    "${pkgs.lib.getLib pkgs.stdenv.cc.cc.libgcc}/lib"
  ];
in {
  home.packages = with pkgs; [
    nixfmt
    gdb
    cloc
    meld
    pv
    jq
    (aspellWithDicts (d: [ d.en ]))
    gcp
    emacs-libvterm
    libgccjit
    python3
    binutils
  ];

  home.file = {
    "tools/bin/emacs" = {
      text = ''
        #!/bin/bash
        export LIBRARY_PATH="${
          pkgs.lib.concatStringsSep ":" libGccJitLibraryPaths
        }"
        exec ~/projects/repos/apps/emacs-link/.build/src/emacs -rv $@
      '';
      executable = true;
    };
    ".gdbinit".source = ./.gdbinit;
  };

  programs.git = {
    lfs.enable = true;
    enable = true;
    userName = "user name";
    userEmail = "user@mail.com";
    aliases = {
      lg =
        "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(magenta)<%an>%Creset' --abbrev-commit --date=relative";
      l = "log --no-merges";
      ll = "log --graph --date=short";
      la = "shortlog -sne";
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

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      prompt = "disabled";
      editor = "emacs";
      pager = "cat";
      aliases = {
        pv = "pr view";
        pl = "pr list";
        iv = "issue view";
        il = "issue list";
      };
    };
  };
}
