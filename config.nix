{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; rec {

    dev-utils = callPackage ./utils {};

    qemu = pkgs.qemu.overrideDerivation (attrs: {
      buildInputs = attrs.buildInputs ++ [ gtk3 gtk3.dev gettext ];
      configureFlags = attrs.configureFlags ++ [ "--enable-gtk" "--target-list=x86_64-softmmu" ];
      postInstall = attrs.postInstall + ''
        ; makeWrapper $out/bin/qemu-system-x86_64  $out/bin/kvm --set GTK_THEME Default --add-flags "-enable-kvm"
      '';
    });
  };
}
