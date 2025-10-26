{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./terminal-base.nix
  ];

  environment.systemPackages = with pkgs; [
    kitty
  ];
}
