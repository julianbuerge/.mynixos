{variables, ...}: let
  rice_dotfile_path = import ../functions/rice_dotfile_path.nix {inherit variables;};
  shared_dotfile_path = import ../functions/shared_dotfile_path.nix;
in {
  imports = [
    (shared_dotfile_path "neovim-nvf/nvf-base.nix")
    (rice_dotfile_path "nvf-theme.nix")
  ];
}
