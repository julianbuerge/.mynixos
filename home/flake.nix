{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zarumet = {
      url = "github:Immelancholy/zarumet";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nvf,
    zarumet,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    setup_user_with_username = import ./functions/setup_user_with_username.nix;
  in {
    homeConfigurations = {
      julian = setup_user_with_username {
        inherit pkgs;
        inherit home-manager;
        inherit nvf;
        inherit zarumet;
        username = "julian";
      };
      dominik = setup_user_with_username {
        inherit pkgs;
        inherit home-manager;
        inherit nvf;
        inherit zarumet;
        username = "dominik";
      };
      booky = setup_user_with_username {
        inherit pkgs;
        inherit home-manager;
        inherit nvf;
        inherit zarumet;
        username = "booky";
      };
    };
  };
}
