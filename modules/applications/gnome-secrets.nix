{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome-secrets
 ];

}
