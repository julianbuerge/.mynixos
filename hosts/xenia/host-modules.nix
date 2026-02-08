{...}: let
  modulepath = modulename: ../../modules/${modulename};
in {
  imports = [
    #hardware
    ./hardware-configuration.nix
    ./filesystems.nix

    #operating system
    (modulepath "system/nixos-options.nix")
    (modulepath "system/brightness.nix")
    (modulepath "system/android-usb.nix")
    (modulepath "system/bluetooth.nix")
    (modulepath "system/printing.nix")
    (modulepath "system/appimage.nix")

    #home
    (modulepath "home/home-manager.nix")

    #tui apps
    (modulepath "applications-tui/basic-terminal-commands.nix")
    (modulepath "applications-tui/btop.nix") #resource manager
    (modulepath "applications-tui/git.nix") #version control system
    (modulepath "applications-tui/playerctl.nix") #media player controls
    (modulepath "applications-tui/libnotify.nix") #media player controls
    (modulepath "applications-tui/ffmpeg.nix") #image and video handler
    (modulepath "applications-tui/mpv.nix") #media player
    (modulepath "applications-tui/abcde.nix") #cd reader

    #coding
    (modulepath "coding/direnv.nix")
    (modulepath "coding/latex.nix")

    #terminal
    (modulepath "terminals/kitty.nix")

    #graphical environment
    (modulepath "environments/mango.nix")

    #gui apps
    (modulepath "applications-gui/keepassxc.nix") #password manager
    (modulepath "applications-gui/zathura.nix") #pdf viewer
    (modulepath "applications-gui/firefox.nix") #browser
    (modulepath "applications-gui/thunderbird.nix") #email client
    (modulepath "applications-gui/audacity.nix") #audio editor
    (modulepath "applications-gui/gimp.nix") #image editor
    (modulepath "applications-gui/makemkv.nix")
    (modulepath "applications-gui/steam.nix")
  ];
}
