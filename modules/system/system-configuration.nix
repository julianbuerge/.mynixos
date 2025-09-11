{ config, pkgs, ... }:

{
  imports =
    [ 
      ./fonts.nix
      ./nvidia.nix
      ./hyprland.nix
      ./coding-backends.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #networking.wireless.enable = true; 
  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Zurich";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "ch";
    variant = "de_nodeadkeys";
  };

  console.keyMap = "sg";

  nixpkgs.config.allowUnfree = true;

  services.pipewire = {
	enable = true;
	alsa.enable = true;
	pulse.enable = true;
  };

  services.openssh = {
    enable = true;
  };

  environment.variables = {
    EDITOR="nvim";
  };

  documentation.doc.enable = false;

  system.stateVersion = "25.05";

}
