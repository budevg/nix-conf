#! /bin/sh -eu

# make gcroot for each dependency of shell and run nix-shell

if [ ! -f shell.nix ]; then
    echo "missing shell.nix"
    exit 1
fi

PWD=`pwd`
set -x
rm -rf .gcroots
mkdir -p .gcroots
nix-instantiate shell.nix --indirect --add-root $PWD/.gcroots/shell.drv
nix-store --indirect --add-root $PWD/.gcroots/shell.dep --realise $(nix-store --query --references $PWD/.gcroots/shell.drv)
exec nix-shell $(readlink $PWD/.gcroots/shell.drv) "$@"
