{ config, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ./filesystems.nix
  ];

  networking.hostName = "nixos"; # Define your hostname.

  users.users.julian = {
    isNormalUser = true;
    description = "Julian";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

}
