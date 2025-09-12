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
    
      #set host name here!  
      hostname = "xenia";       #this could perhaps be soft coded with builints.readDir and then passing the hostname in the switch command but very unsure about this

      #get the host variables (which contain system and user level and are therefore in the system directory)
      variables = import  ../../../hosts/${hostname}/variables.nix;
   in
    {
      homeConfigurations.${variables.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
            nvf.homeManagerModules.default
            ../../home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
            inherit variables;
        };
      };
    };
}
