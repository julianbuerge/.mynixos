{variables, ...}: let
  modulepath = modulename: ../../modules/${modulename};
in {
  home.username = variables.username;
  home.homeDirectory = "/home/${variables.username}";

  #let home-manager manage itself
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";

  imports = [
    #services
    (modulepath "mpd.nix")

    #coding
    (modulepath "git.nix")

    #terminal
    (modulepath "kitty.nix")
    (modulepath "neovim-nvf.nix")
    (modulepath "starship.nix")
    (modulepath "bash.nix")

    #graphical environment
    (modulepath "hyprland.nix")
    (modulepath "gtk.nix")
    (modulepath "wofi.nix")
    (modulepath "waybar.nix")
    (modulepath "modify-desktop-entries.nix")
    (modulepath "fonts.nix")

    #applications
    (modulepath "yazi.nix")
    (modulepath "firefox-bookmarks.nix")
    (modulepath "mpv.nix")
    (modulepath "zathura.nix")
    (modulepath "zarumet.nix")
  ];
}
