#OPTIONALLY change the imports
{ config, pkgs, ... }:

let

variables = import ./variables.nix;
inherit (variables) hostname realname username;

in {


  imports = [
    #hardware specific modules
    ./hardware-configuration.nix
    ./filesystems.nix


    #if you are on nixos, this configures the system
    ../../modules/system/nixos-options.nix

    #import the coding environments of choice
    ../../modules/coding/coding-backends.nix



    #import the terminal of choice, automatically comes with packages for commands
    ../../modules/terminals/kitty.nix

    #import the graphical environment of choice
    ../../modules/environments/hyprland.nix



    #import basic gui apps of choice
    ../../modules/applications/yazi.nix #file manager
    ../../modules/applications/zathura.nix #pdf viewer
    ../../modules/applications/mpv.nix #audio, video and image player

    #import the password manager gui app of choice
    ../../modules/applications/gnome-secrets.nix

    #import onlineness gui apps of choice
    ../../modules/applications/firefox.nix #browser
    ../../modules/applications/thunderbird.nix #email client
    


    #additional things
    ./additional-options.nix
    ./additional-packages.nix
  ];

  networking.hostName = hostname;

  users.users.${username} = {
    isNormalUser = true;
    description = realname;
    extraGroups = [ "networkmanager" "wheel" "cdrom" ];
    packages = with pkgs; [];
  };

}
