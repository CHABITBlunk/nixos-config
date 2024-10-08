{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        shuixing = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          retraGroups = [ "wheel" "audio" ];
          modules = [
            ./hosts/shuixing/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
  };
}
