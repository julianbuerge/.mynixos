{
  nixpkgs,
  pkgs_nvidia,
  hostname,
  mango,
  ...
}: let
  variables = import ../hosts/${hostname}/host-variables.nix;
  nvidia_import =
    if variables.use_nvidia
    then [../modules/system/nvidia.nix]
    else [];
in
  nixpkgs.lib.nixosSystem {
    modules =
      [
        mango.nixosModules.mango
        ../hosts/${hostname}/host-modules.nix
      ]
      ++ nvidia_import;

    #this get passed to the modules above
    specialArgs = {
      inherit variables pkgs_nvidia;
    };
  }
