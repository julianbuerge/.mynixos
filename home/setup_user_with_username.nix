{
  pkgs,
  home-manager,
  nvf,
  username,
}: let
  variables = import ./users/${username}/user-variables.nix;
in
  home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [
      nvf.homeManagerModules.default
      ./users/${username}/home.nix
    ];

    extraSpecialArgs = {inherit variables;}; #these will get passed to home.nix
  }
