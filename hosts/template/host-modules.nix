{
  config,
  pkgs,
  ...
}: {
  imports = [
    #hardware
    ./hardware-configuration.nix
    ./filesystems.nix

    #operating system
    ../../modules/system/nixos-options.nix
    ../../modules/system/android-usb.nix
    ../../modules/system/bluetooth.nix
    ../../modules/system/printing.nix

    #coding
    ../../modules/coding/lua.nix
    ../../modules/coding/latex.nix
    ../../modules/coding/julia.nix

    #terminal with command packages
    ../../modules/terminals/kitty.nix

    #graphical environment
    ../../modules/environments/hyprland.nix

    #basic gui apps
    ../../modules/applications/yazi.nix #file manager
    ../../modules/applications/zathura.nix #pdf viewer
    ../../modules/applications/mpv.nix #audio, video and image player

    #password manager
    ../../modules/applications/gnome-secrets.nix

    #onlineness
    ../../modules/applications/firefox.nix #browser
    ../../modules/applications/thunderbird.nix #email client

    ./additional-options.nix
    ./additional-packages.nix
  ];
}
