{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
in {
  home.file = {
    ".config/waybar/config".source = rice_dotfile_path "waybar-config";
    ".config/waybar/style.css".source = rice_dotfile_path "waybar-style.css";
  };
}
