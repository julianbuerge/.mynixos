{
  config,
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

  users.users.${username} = {
    isNormalUser = true;
    description = realname;
    extraGroups = ["networkmanager" "wheel" "cdrom" "input"];
    packages = with pkgs; [];
  };

  #imports are a list, which is the sum of the written and the nvidia_import list
  imports =
    [
      ./fonts.nix
    ]
    ++ nvidia_import;

  environment.systemPackages = with pkgs; [
    nh #nix helper utility, e.g. for garbage collection
    home-manager #declarative dot file management
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

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
    EDITOR = "nvim"; #will get installed as nvf through home-manager
  };

  documentation.doc.enable = false;

  system.stateVersion = "25.05";
}
