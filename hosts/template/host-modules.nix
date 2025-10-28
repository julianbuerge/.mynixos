{
  config,
  pkgs,
  ...
}: let
  modulepath = modulename: ../../modules/${modulename};
in {
  imports = [
    #hardware
    ./hardware-configuration.nix
    ./filesystems.nix

    #operating system
    (modulepath "system/nixos-options.nix")
    (modulepath "system/android-usb.nix")
    (modulepath "system/bluetooth.nix")
    (modulepath "system/printing.nix")

    #coding
    (modulepath "coding/lua.nix")
    (modulepath "coding/latex.nix")
    (modulepath "coding/julia.nix")

    #terminal with command packages
    (modulepath "terminals/kitty.nix")

    #graphical environment
    (modulepath "environments/hyprland.nix")

    #basic gui apps
    (modulepath "applications/yazi.nix") #file manager
    (modulepath "applications/zathura.nix") #pdf viewer
    (modulepath "applications/mpv.nix") #media player

    #password manager
    (modulepath "applications/gnome-secrets.nix")
    (modulepath "applications/keepassxc.nix")

    #onlineness
    (modulepath "applications/firefox.nix") #browser
    (modulepath "applications/thunderbird.nix") #email client

    ./additional-options.nix
    ./additional-packages.nix
  ];
}
