{
  config,
  pkgs,
  variables,
  ...
}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
in {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  home.file = {
    ".config/starship.toml".source = rice_dotfile_path "starship.toml";
  };
}
