{
  pkgs,
  variables,
  ...
}: let
  inherit (variables) hostname realname username use_nvidia;

  #define a list with either one item ./nvidia.nix or no item
  nvidia_import =
    if use_nvidia
    then [./nvidia.nix]
    else [];
in {
  networking.hostName = hostname;

  #the keyboard layout in the TTY, sg = swiss german.
  console.keyMap = "sg";

  users.users.${username} = {
    isNormalUser = true;
    description = realname;
    extraGroups = ["networkmanager" "wheel" "cdrom" "input" "media"];
    packages = with pkgs; [];
  };

  #meant to be the ownership for media drives
  users.groups.media = {
    gid = 4000;
  };

  #imports are a list, which is the sum of the written and the nvidia_import list
  imports =
    [
      ./fonts.nix
    ]
    ++ nvidia_import;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.optimise = {
    automatic = true;
    dates = ["weekly"];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  time.timeZone = "Europe/Zurich";

  i18n.defaultLocale = "en_US.UTF-8";

  #allows detecting optical drives, sg = SCSI Generic
  boot.kernelModules = ["sg"];

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
    EDITOR = "nvim"; #will get installed as nvf through home-manager
  };

  documentation.doc.enable = false;

  system.stateVersion = "25.05";
}
