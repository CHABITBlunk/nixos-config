{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
	  nixosConfigurations  = {
		  shuixing = nixpkgs.lib.nixosSystem {
			  system = "x86_64-linux";
			  specialArgs = { inherit inputs; };
			  modules = [
				  ./hosts/shuixing/configuration.nix
				  { home-manager.users.xiaolong = ./hosts/shuixing/home.nix; }
			  ];
		  };
		  mingwangxing = nixpkgs.lib.nixosSystem {
		    system = "aarch64-linux";
		    specialArgs = { inherit inputs; };
		    modules = [ 
          ./hosts/mingwangxing/configuration.nix
		      { home-manager.users.zongtong = ./hosts/mingwangxing/home.nix; }
		    ];
		  };
	  };
  };
}
