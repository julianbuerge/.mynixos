{
  description = "BaseFlake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {

	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		modules = [
		    ./hosts/host.nix
		    ./modules/system/system-configuration.nix
		    ./modules/applications/application-configuration.nix
		];
	};
  };
}
