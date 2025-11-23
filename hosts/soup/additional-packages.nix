#COMPLETELY OPTIONAL
{
  config,
  pkgs,
  ...
}: {
  #find the names of packages at search.nixos.org/packages
  environment.systemPackages = with pkgs; [
    jetbrains.clion
    gcc
    gnumake
    pkg-config
  ];
}
