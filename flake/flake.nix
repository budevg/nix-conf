{
  description = "system config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs-args = {
        inherit system;
        config = { allowUnfree = true; };
      };
      pkgs = import nixpkgs pkgs-args;
      unstable = import nixpkgs-unstable pkgs-args;
    in {
      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];

        extraSpecialArgs = { inherit unstable; };
      };
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [ ./configuration.nix ];
        };
      };
    };
}
