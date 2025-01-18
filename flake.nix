{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
    };
  in
  {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    packages.default = pkgs.mkshell {
      buildInputs = [
        pkgs.python310
        pkgs.git        
        pkgs.docker
      ];
    };
    devShells.default = pkgs.mkshell {
      buildInputs = [
        pkgs.python310
        pkgs.git
        pkgs.docker 
      ];
    };

  };
}
