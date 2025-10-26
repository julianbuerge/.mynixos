{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
in {
  home.file = {
    ".config/kitty/kitty.conf".source = rice_dotfile_path "kitty.conf";
  };
}
