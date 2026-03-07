{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
in {
  home.file = {
    ".config/mako/config".source = rice_dotfile_path "mako-config";
  };
}
