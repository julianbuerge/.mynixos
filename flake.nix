{
  description = "My NixOS system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    mango,
    ...
  }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    setup_host_with_hostname = import ./functions/setup_host_with_hostname.nix;

    setup_devShell = import ./functions/setup_devshell.nix;
  in {
    nixosConfigurations = {
      xenia = setup_host_with_hostname {
        inherit nixpkgs;
        hostname = "xenia";
        inherit mango;
      };
      panther = setup_host_with_hostname {
        inherit nixpkgs;
        hostname = "panther";
        inherit mango;
      };
    };

    #devShells get built on first entry => implicit choice which ones get installed
    devShells.${system} = {
      sciml = setup_devShell {
        inherit pkgs;
        shellname = "sciml";
      };
      scimlcuda = setup_devShell {
        inherit pkgs;
        shellname = "scimlcuda";
      };
      bioprocess-experiment = setup_devShell {
        inherit pkgs;
        shellname = "bioprocess-experiment";
      };
      bioprocess-experiment-cuda = setup_devShell {
        inherit pkgs;
        shellname = "bioprocess-experiment-cuda";
      };
      numba = setup_devShell {
        inherit pkgs;
        shellname = "numba";
      };
      spacemonkeys = setup_devShell {
        inherit pkgs;
        shellname = "spacemonkeys";
      };
      haskell = setup_devShell {
        inherit pkgs;
        shellname = "haskell";
      };
    };
  };
}
