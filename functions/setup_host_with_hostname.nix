{
  inputs,
  nixpkgs,
  hostname,
}: let
  variables = import ../hosts/${hostname}/host-variables.nix;
in
  nixpkgs.lib.nixosSystem {
    modules = [
      ../hosts/${hostname}/host-modules.nix
    ];

    specialArgs = {
      inherit variables;
      inherit inputs;
    }; #this get passed to the modules above
  }
