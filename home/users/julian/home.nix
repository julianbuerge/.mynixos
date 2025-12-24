{
  config,
  pkgs,
  variables,
  ...
}: {
  home.username = variables.username;
  home.homeDirectory = "/home/${variables.username}";

  #let home-manager manage itself
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";

  imports = [
    #services
    ../../modules/mpd.nix

    #coding
    ../../modules/git.nix

    #terminal
    ../../modules/kitty.nix
    ../../modules/neovim-nvf.nix
    ../../modules/starship.nix
    ../../modules/bash.nix

    #graphical environment
    ../../modules/hyprland.nix
    ../../modules/gtk.nix
    ../../modules/wofi.nix
    ../../modules/waybar.nix
    ../../modules/modify-desktop-entries.nix
    ../../modules/fonts.nix

    #applications
    ../../modules/yazi.nix
    ../../modules/firefox-bookmarks.nix
    ../../modules/mpv.nix
    ../../modules/zarumet.nix
  ];
}
