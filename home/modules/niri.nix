{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
in {
  home.file = {
    ".config/niri/config.kdl".source = rice_dotfile_path "niri.kdl";
  };
}
