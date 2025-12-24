{
  nixpkgs,
  zarumet,
  hostname,
}: let
  variables = import ../hosts/${hostname}/host-variables.nix;
in
  nixpkgs.lib.nixosSystem {
    modules = [
      ../hosts/${hostname}/host-modules.nix
    ];
    #this get passed to the modules above
    specialArgs = {
      inherit zarumet;
      inherit variables;
    };
  }
