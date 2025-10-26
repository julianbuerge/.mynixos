{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
in {
  home.file = {
    ".config/hypr/hyprland.conf".source = rice_dotfile_path "hyprland.conf";
  };
}
