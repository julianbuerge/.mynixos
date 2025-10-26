{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
in {
  home.file = {
    ".config/wofi/config".source = rice_dotfile_path "wofi-config";
    ".config/wofi/style.css".source = rice_dotfile_path "wofi-style.css";
  };
}
