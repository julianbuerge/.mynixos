{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
  shared_dotfile_path = import ../functions/shared_dotfile_path.nix;
in {
  import = [
    (shared_dotfile_path "zarumet/zarumet.nix")
  ];
  home.file = {
    ".config/zarumet/config.toml".source = rice_dotfile_path "zarumet.toml";
  };
}
