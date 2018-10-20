{ pkgs
}:

with pkgs.python3Packages;
buildPythonPackage rec {
  pname = "gcp";
  version = "0.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0d8f4acd2c766a40157d52438232ec58da30030807b6b4a768772cb13c30fd2a";
  };

  propagatedBuildInputs = [ pygobject3 dbus-python progressbar33 ];
  installFlags = "--no-dependencies";
  checkPhase = ''
  '';

  meta = with pkgs.lib; {
    description = "An advanced file copy tool loosely inspired from cp";
    homepage    = https://code.lm7.fr/mcy/gcp;
    license     = licenses.gpl3;
  };
}
