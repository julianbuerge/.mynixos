{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
  shared_dotfile_path = import ../functions/shared_dotfile_path.nix;
in {
  home.file = {
    ".config/yazi/yazi.toml".source = shared_dotfile_path "yazi/yazi.toml";
    ".config/yazi/keymap.toml".source = shared_dotfile_path "yazi/yazi-keymap.toml";
    ".config/yazi/theme.toml".source = rice_dotfile_path "yazi-theme.toml";
  };
}
