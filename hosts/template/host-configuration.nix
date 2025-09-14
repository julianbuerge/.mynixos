#NOTHING TO DO HERE; IT JUST COMBINES ALL THE OTHER MODULES
{ config, pkgs, ... }:

let

variables = import ./variables.nix;
inherit (variables) hostname realname username;

in {


  imports = [
    ./hardware-configuration.nix
    ./filesystems.nix
    ./additional-configuration.nix
    ./additional-packages.nix
  ];

  networking.hostName = hostname;

  users.users.${username} = {
    isNormalUser = true;
    description = realname;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

}
