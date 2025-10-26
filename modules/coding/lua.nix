{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    texliveFull
    lua
    julia
  ];
}
