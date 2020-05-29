{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; rec {

    gcp = callPackage ./pkgs/gcp {};
    cscope-indexer = callPackage ./pkgs/cscope-indexer {};
    autopatchelf = callPackage ./pkgs/autopatchelf {};

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
