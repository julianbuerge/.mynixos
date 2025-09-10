{ config, pkgs, ... }:

{

  imports =
    [ 
      ./terminal.nix
      ./gui-apps.nix
      ./firefox.nix
      ./thunderbird.nix
    ];

}
