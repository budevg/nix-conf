{ python3Packages, wrapGAppsHook3 }:

with python3Packages;
buildPythonPackage rec {
  pname = "gcp";
  version = "0.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "b6c70d54f8f4f9ffe565b92425389a790dadba0d9aca5852ff4ac13cd412b23a";
  };

  build-system = [
    setuptools
  ];

  nativeBuildInputs = [ wrapGAppsHook3 ];
  propagatedBuildInputs = [ pygobject3 dbus-python progressbar33 ];
  pipInstallFlags = "--no-dependencies";
  dontUseSetuptoolsCheck = true;
  checkPhase = "";

  meta = with pkgs.lib; {
    description = "An advanced file copy tool loosely inspired from cp";
    homepage = "https://code.lm7.fr/mcy/gcp";
    license = licenses.gpl3;
  };
}
