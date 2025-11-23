#COMPLETELY OPTIONAL
{
  config,
  pkgs,
  ...
}:
#find possible options at search.nixos.org/options
{
  services.blueman.enable = true;
}
