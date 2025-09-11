{ config, pkgs, ... }:

let

names = import ./names.nix;

inherit (names) hostname realname username;

hostfile_path = hostfile_name : ./${hostname} + "/${hostfile_name}";

in {


  imports = [
    (hostfile_path "hardware-configuration.nix")
    (hostfile_path "filesystems.nix")
  ];

  networking.hostName = hostname;

  users.users.${username} = {
    isNormalUser = true;
    description = realname;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

}
