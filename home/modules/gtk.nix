{
  pkgs,
  variables,
  ...
}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
in {
  imports = [
    (rice_dotfile_path "gtk.nix")
  ];

  #this fixes the following bug: https://github.com/nix-community/home-manager/issues/3113
  home.packages = [pkgs.dconf];
}
