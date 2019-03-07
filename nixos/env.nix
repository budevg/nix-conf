{ config, pkgs, ... }:

{
  environment.variables = {
    # workaround for empty java window in xmonad
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
