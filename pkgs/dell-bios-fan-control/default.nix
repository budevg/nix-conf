{ stdenv, fetchFromGitHub}:
stdenv.mkDerivation {
  name = "dell-bios-fan-control";

  src = fetchFromGitHub {
    owner = "TomFreudenberg";
    repo = "dell-bios-fan-control";
    rev = "a2c81a2918b15b97bdb1c6bf41233e4c2786d416";
    sha256 = "1d1cc4j6cz900mcf55kqfywzddv809yp0lsfwg8j890bv1s7riwa";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp dell-bios-fan-control $out/bin
  '';
}
