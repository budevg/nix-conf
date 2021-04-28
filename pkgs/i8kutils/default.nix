{ stdenv, fetchFromGitHub, tcl, acpi }:
stdenv.mkDerivation {
  name = "i8kutils";

  src = fetchFromGitHub {
    owner = "vitorafsr";
    repo = "i8kutils";
    rev = "c993fb1da1bba5c2cd2860c1aa6c3916b4de77e4";
    sha256 = "0dlfv5chc7izqg0rbllw32i3my3sv229mrz1qgwxc01ghbip00y8";
  };

  buildInputs = [ tcl acpi ];
  patchPhase = ''
    sed -ie "s|I8KCTL=.*|I8KCTL=$out/bin/i8kctl|" i8kfan
    sed -ie "s|/usr/bin/i8kfan|$out/bin/i8kfan|" i8kmon
    sed -ie "s|/etc/i8kmon.conf|$out/etc/i8kmon.conf|" i8kmon
    sed -ie "s|\"acpi\"|\"${acpi}/bin/acpi\"|" i8kmon
  '';
  installPhase = ''
    mkdir -p $out/bin $out/etc
    cp i8kfan i8kmon i8kctl $out/bin
    cp i8kmon.conf $out/etc
  '';
}
