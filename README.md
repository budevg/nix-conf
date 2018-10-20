# nix-conf

```bash
sudo mkdir /nix
sudo chown `id -un`:`id -un` /nix
curl https://nixos.org/nix/install | bash -x
git clone git@github.com:budevg/nix-conf.git ~/.nixpkgs
cd ~/.nixpkgs
nix-shell -p python27Packages.pyyaml --command "python build.py"
```
