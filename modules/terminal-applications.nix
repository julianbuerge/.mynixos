{ config, pkgs, ... }:


{
  environment.systemPackages = with pkgs; [
    home-manager #dotfile management package,
    kitty #the terminal itself
    nh
    bat
    neovim
    git
    tealdeer
    cowsay
    asciiquarium
    sl
    cmatrix
    fastfetch
    tree
    btop
    unzip
    yazi
  ];

}
