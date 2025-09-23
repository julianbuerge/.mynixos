{ config, pkgs, ... }:

{
  imports = [
    ./terminal-base.nix
  ];

  environment.systemPackages = with pkgs; [
    kitty
  ];
    
  #install a nerd font to use in kitty (the kitty config sets it)
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

}
