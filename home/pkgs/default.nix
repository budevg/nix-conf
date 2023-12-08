{ config, pkgs, ... }:

let
  extra-packages = final: prev: {
    kmonad = prev.callPackage ./kmonad { };
    gcp = prev.callPackage ./gcp { };
    emacs-libvterm = prev.callPackage ./emacs-libvterm { };
    cscope-indexer = prev.callPackage ./cscope-indexer { };
    autopatchelf = prev.callPackage ./autopatchelf { };
    dell-bios-fan-control = prev.callPackage ./dell-bios-fan-control { };
    i8kutils = prev.callPackage ./i8kutils { };

    kvm-gtk = prev.qemu.overrideDerivation (attrs: {
      buildInputs = attrs.buildInputs
        ++ [ final.gtk3 final.gtk3.dev final.gettext ];
      configureFlags = attrs.configureFlags
        ++ [ "--disable-docs" "--enable-gtk" "--target-list=x86_64-softmmu" ];
      postInstall = attrs.postInstall + ''
        ; makeWrapper $out/bin/qemu-system-x86_64  $out/bin/kvm --set GTK_THEME Default --add-flags "-enable-kvm"
      '';
    });
  };
in { nixpkgs.overlays = [ extra-packages ]; }
