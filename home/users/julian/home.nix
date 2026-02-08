{variables, ...}: let
  modulepath = modulename: ../../modules/${modulename};
in {
  home.username = variables.username;
  home.homeDirectory = "/home/${variables.username}";

  #let home-manager manage itself
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";

  imports = [
    #coding
    (modulepath "git.nix")

    #terminal
    (modulepath "kitty.nix")
    (modulepath "neovim-nvf.nix")
    (modulepath "starship.nix")
    (modulepath "bash.nix")
    (modulepath "fastfetch.nix")

    #graphical environment
    (modulepath "mango.nix")
    (modulepath "gtk.nix")
    (modulepath "fonts.nix")

    #applications
    (modulepath "firefox-bookmarks.nix")
    (modulepath "mpv.nix")
    (modulepath "zathura.nix")
  ];
}
