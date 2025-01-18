{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: 
    flake-utils.lib.eachDefaultSystem ( system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations = {
        machine = pkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configs/system.nix
          ];
        };
      };
    });
}
