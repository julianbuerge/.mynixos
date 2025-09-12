{ config, pkgs, variables, ... }:

let

#define a list with either one item ./nvidia.nix or no item
nvidia_import = if variables.use_nvidia then
    [ ./nvidia.nix ] else [];

in {
  #imports are a list, which is the sum of the written and the nvidia_import list
  imports =
    [ 
      ./fonts.nix
      ./hyprland.nix
      ./coding-backends.nix
    ] ++ nvidia_import;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
