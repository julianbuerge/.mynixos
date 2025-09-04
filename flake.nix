{
  description = "BaseFlake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		modules = [
		    ./hosts/hardware-configuration.nix
		    ./hosts/filesystems.nix
		    ./configuration.nix
		];
	};
  };
}
