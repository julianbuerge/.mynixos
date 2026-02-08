{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
in {
  home.file = {
    ".config/fastfetch/config.jsonc".source = rice_dotfile_path "fastfetch.jsonc";
  };
}
