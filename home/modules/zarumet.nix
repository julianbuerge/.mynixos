{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
in {
  programs.zarumet.enable = true;

  home.file = {
    ".config/zarumet/config.toml".source = rice_dotfile_path "zarumet.toml";
  };
}
