{ config, pkgs, ... }:

let

variables = import ./variables.nix;
inherit (variables) hostname realname username;

in {


  imports = [
    ./hardware-configuration.nix
    ./filesystems.nix
    ./additional-packages.nix
    ./additional-options.nix
  ];

  networking.hostName = hostname;

  users.users.${username} = {
    isNormalUser = true;
    description = realname;
    extraGroups = [ "networkmanager" "wheel" "cdrom" ];
    packages = with pkgs; [];
  };

}
