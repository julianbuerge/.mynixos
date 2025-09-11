{ config, pkgs, ... }:

let

hostname = "xenia";

name = "Julian";
username = "julian";

hostfile_path = hostfile_name : ./${hostname} + "/${hostfile_name}";

in {


  imports = [
    (hostfile_path "hardware-configuration.nix")
    (hostfile_path "filesystems.nix")
  ];

  networking.hostName = hostname;

  users.users.${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

}
