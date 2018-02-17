{stdenv}:

stdenv.mkDerivation rec {
  name = "dev-utils";
  src = ./.;
  installPhase = ''
    install -dm 755 $out/bin
    install $src/*.sh $out/bin
  '';
}
