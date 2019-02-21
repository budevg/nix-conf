{ config, pkgs, ... }:

{
  users.users.root.initialHashedPassword = "";
  users.users.evgenyb = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    uid = 1000;
    group = "evgenyb";
    password = "123456";
  };
  users.groups.evgenyb = {
    gid = 1000;
  };

}
