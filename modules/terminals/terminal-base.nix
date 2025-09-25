{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nh #nix helper utility, e.g. for garbage collection
    home-manager #declarative dot file management
    bat #visually appealing cat
    git #source control system
    tealdeer #short version of man pages
    cowsay #fun
    asciiquarium #fun
    sl #fun
    cmatrix #fun
    tree #hierarchical ls
    fastfetch #show system info
    btop #task manager
    unzip #archive extractor
    playerctl  #media controls
    grim #wayland screenshots
    slurp #wayland screenshots
    libnotify #notifications cli tool
  ];

}
