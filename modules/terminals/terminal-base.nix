{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nh
    home-manager
    bat
    git
    tealdeer
    cowsay
    asciiquarium
    sl
    cmatrix
    tree
    fastfetch
    btop
    unzip
    playerctl
    grim
    slurp
  ];

}
