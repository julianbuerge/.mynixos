{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
  shared_dotfile_path = import ../functions/shared_dotfile_path.nix;
in {
  imports = [
    (shared_dotfile_path "gtk/gtk.nix")
    (rice_dotfile_path "gtk.nix")
  ];
}
