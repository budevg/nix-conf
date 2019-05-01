#! /usr/bin/env nix-shell
#! nix-shell -i python -p python27Packages.pyyaml

import yaml
import os

def install_cmd(pkgs, dry_run=True):
    res = "nix-env -i %s" % " ".join(("-A nixos.%s" % p for p in pkgs))
    if dry_run:
        res += " --dry-run"
    return res

def main():
    packages_path = os.path.join(os.path.dirname(__file__),"packages.yaml")
    all_pkgs = []
    cfg = yaml.load(open(packages_path).read())
    for name, pkgs in cfg.iteritems():
        all_pkgs.extend(pkgs)
        print "echo %s" % name, ";", install_cmd(pkgs)

    print "=== install ==="
    print install_cmd(all_pkgs)

if __name__ == '__main__':
    main()
