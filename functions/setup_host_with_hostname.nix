{
  nixpkgs,
  hostname,
}: let
  variables = import ../hosts/${hostname}/host-variables.nix;
in
  nixpkgs.lib.nixosSystem {
    modules = [
      ../hosts/${hostname}/host-modules.nix
    ];

    specialArgs = {inherit variables;}; #this get passed to the modules above
  }
