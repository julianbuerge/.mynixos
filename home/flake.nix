{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:NotAShelf/nvf";
  };

  outputs =
    { nixpkgs, home-manager, nvf, ... }:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    
        setup = username :  let 
                                variables = import ./users/${username}/user-variables.nix;
                            in 
                                home-manager.lib.homeManagerConfiguration {
                                    inherit pkgs;

                                    modules = [
                                        nvf.homeManagerModules.default
                                        ./users/${username}/home.nix
                                    ];

                                    #these will get passed to home.nix
                                    extraSpecialArgs = { inherit variables; };
        };
    in
    {
        homeConfigurations = {
            julian = setup "julian";
            dominik = setup "dominik";
        };
    };
}
