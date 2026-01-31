{...}: let
  shared_dotfile_path = import ../functions/shared_dotfile_path.nix;
in {
  home.file = {
    ".config/zathura/zathurarc".source = shared_dotfile_path "zathura/zathurarc";
  };
}
