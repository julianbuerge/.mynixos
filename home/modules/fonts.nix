{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
in {
  imports = [
    (rice_dotfile_path "fonts.nix")
  ];
}
