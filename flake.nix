{
  description = "My NixOS system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
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
      };
      panther = setup_host_with_hostname {
        inherit nixpkgs;
        hostname = "panther";
      };
    };

    #devShells get built on first entry => implicit choice per host
    devShells.${system} = {
      sciml = setup_devShell {
        inherit pkgs;
        shellname = "sciml";
      };
      scimlcuda = setup_devShell {
        inherit pkgs;
        shellname = "scimlcuda";
      };
      numba = setup_devShell {
        inherit pkgs;
        shellname = "numba";
      };
      spacemonkeys = setup_devShell {
        inherit pkgs;
        shellname = "spacemonkeys";
      };
    };
  };
}
