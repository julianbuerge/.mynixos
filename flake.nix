{
  description = "BaseFlake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:

        let
        system = "x86_64-linux"; #could this become part of host-variables.nix?
        pkgs = import nixpkgs {
                                inherit system;
                                config.allowUnfree = true;
                              };

        #define a function that takes the hostname and sets up all the modules 
	setup = hostname : let 
                              variables = import ./hosts/${hostname}/host-variables.nix;
                           in 
                           nixpkgs.lib.nixosSystem {
		                modules = [
		                    ./hosts/${hostname}/host-modules.nix
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

            #import all the devShells. Shells get built the first time they are entered
            #whereby a host chooses which shells they want to use
            devShells.${system} = {
                sciml = import ./devshells/sciml-shell.nix { inherit pkgs; };
                scimlcuda = import ./devshells/scimlcuda-shell.nix { inherit pkgs; };
                numba = import ./devshells/numba-shell.nix { inherit pkgs; };
                spacemonkeys = import ./devshells/spacemonkeys-shell.nix { inherit pkgs; };
           }; 
        };
}
