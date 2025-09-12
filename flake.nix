{
  description = "BaseFlake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:

        let

        #define a function that takes the hostname and sets up all the modules 
	setup = hostname : let 
                              variables = import ./hosts/${hostname}/variables.nix;
                           in 
                           nixpkgs.lib.nixosSystem {
		                modules = [
		                    ./hosts/${hostname}/host-configuration.nix
		                    ./modules/system/system-configuration.nix
		                    ./modules/applications/application-configuration.nix
		                ];
                           #this get passed to the modules above
                           specialArgs = { inherit variables; };
	};

        in {

            #call the function for each available host
            nixosConfigurations = {
                xenia = setup "xenia";
                panther = setup "panther";
            };
  };
}
