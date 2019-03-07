{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; rec {

    misc-utils = callPackage ./pkgs/misc-utils {};
    dotfiles = callPackage ./pkgs/dotfiles {};
    gcp = callPackage ./pkgs/gcp {};
    cscope-indexer = callPackage ./pkgs/cscope-indexer {};
    autopatchelf = callPackage ./pkgs/autopatchelf {};
    ghidra =
      let
        unstable = import <unstable> {};
      in
        callPackage ./pkgs/ghidra {openjdk11 = unstable.openjdk11;};

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
