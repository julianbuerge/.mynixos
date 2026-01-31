{
  nixpkgs,
  hostname,
  mango,
  ...
}: let
  variables = import ../hosts/${hostname}/host-variables.nix;
in
  nixpkgs.lib.nixosSystem {
    modules = [
      mango.nixosModules.mango
      ../hosts/${hostname}/host-modules.nix
    ];
    #this get passed to the modules above
    specialArgs = {
      inherit variables;
    };
  }
