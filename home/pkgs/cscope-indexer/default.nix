{ stdenv, cscope }:
stdenv.mkDerivation {
  name = "cscope-indexer";
  buildInputs = [ cscope ];
  src = ./.;
  installPhase = ''
    install -dm 755 $out/bin
    cp ${cscope}/libexec/cscope/cscope-indexer $out/bin
    sed -i 's/cc|hh/cc|hh|S|go/' $out/bin/cscope-indexer
  '';
}
