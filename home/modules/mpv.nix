{variables, ...}: let
  shared_dotfile_path = import ../functions/shared_dotfile_path.nix;

  #look at use_nvidia (boolean) to install the right mpv config
  mpv_config_path =
    if variables.configure_with_nvidia
    then shared_dotfile_path "mpv/mpv-nvidia.conf"
    else shared_dotfile_path "mpv/mpv-cpu.conf";
in {
  home.file = {
    ".config/mpv/mpv.conf".source = mpv_config_path;
  };
}
