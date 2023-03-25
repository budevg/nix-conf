{
  allowUnfree = true;
  # android_sdk.accept_license = true;
  packageOverrides = pkgs: with pkgs; rec {

    kmonad = callPackage ./pkgs/kmonad {};
    gcp = callPackage ./pkgs/gcp {};
    emacs-libvterm = callPackage ./pkgs/emacs-libvterm {};
    cscope-indexer = callPackage ./pkgs/cscope-indexer {};
    autopatchelf = callPackage ./pkgs/autopatchelf {};
    dell-bios-fan-control = callPackage ./pkgs/dell-bios-fan-control {};
    i8kutils = callPackage ./pkgs/i8kutils {};

    kvm-gtk = pkgs.qemu.overrideDerivation (attrs: {
      buildInputs = attrs.buildInputs ++ [ gtk3 gtk3.dev gettext ];
      configureFlags = attrs.configureFlags ++ [
        "--disable-docs" "--enable-gtk" "--target-list=x86_64-softmmu"
      ];
      postInstall = attrs.postInstall + ''
        ; makeWrapper $out/bin/qemu-system-x86_64  $out/bin/kvm --set GTK_THEME Default --add-flags "-enable-kvm"
      '';
    });
  };
}
