# My NixOS
This is my personal NixOS setup as a Nix project which by its fully declarative nature makes the setup trivially reproducible.

## Overview
Base environment:
 * [Hyprland](https://github.com/hyprwm/Hyprland) (highly customizable dynamic tiling window manager with GPU rendering with the latest wayland features) 
 * [Waybar](https://github.com/Alexays/Waybar) (status bar for wayland)
 * [wofi](https://github.com/SimplyCEO/wofi) (app launcher for wayland).
 * [swww](https://github.com/LGFae/swww) (efficient animated wallpaper daemon for wayland)
 * [mpvpaper](https://github.com/GhostNaN/mpvpaper) (wayland video wallpaper program based on mpv)
 * [dunst](https://github.com/dunst-project/dunst) (lightweight notification daemon for wayland)

The heart piece of my workflow for programming and creating documents with LaTeX:
 * [kitty](https://sw.kovidgoyal.net/kitty/) (fast feature-rich GPU based terminal) 
 * [neovim](https://github.com/neovim/neovim) (terminal based highly configurable text editor)

Basic apps:
 * [Yazi](https://github.com/sxyazi/yazi) (blazingly fast terminal file manager)
 * [zathura](https://github.com/pwmt/zathura) (functional document viewer with an extremely minimal design) 
 * [mpv](https://github.com/mpv-player/mpv) (free terminal media player)

Editors (These are installed as additional packages for some hosts):
 * [Audacity](https://github.com/audacity/audacity) (easy-to-use, multi-track audio editor)
 * [GIMP](https://www.gimp.org/) (cross-platform image editor)

Onlineness
 * [Gnome-secrets](https://gitlab.gnome.org/World/secrets) (Gnome's GTK password manager using the KeePass v.4 format)
 * [Thunderbird](https://www.thunderbird.net/en-US/) (privacy focused open source email client from Mozilla)
 * [Firefox](https://github.com/mozilla-firefox/firefox) (Mozilla's web browser)

Just for fun (These are installed as additional packages for some hosts):
 * [Hypnotix](https://github.com/linuxmint/hypnotix) (IPTV streaming application with support for live TV, movies and series)
 * [Steam](https://store.steampowered.com) (gaming platform)

## Usage

### Setup
Assuming you are on a computer with NixOS and with git installed, clone this repository to `$HOME/.mynixos`. Navigate into it. You will need to adapt the configuration to use your computer as a new host, both for the system and home-manager flake. 

First on a system level. Copy the directory `hosts/template` to `hosts/examplehostname` where `examplehostname` is the name you want your machine to have. You will need edit one of the files and add a new one. Optionally you can edit several more files:
 1. Copy `/etc/nixos/hardware-configuration.nix` into the directory. This is the hardware configuration that NixOS automatically created during install and is unique to your machine. 
 2. Edit `variables.nix` by setting all the variables (hostname, username, use_nvidia, ...).
 3. OPTIONALLY edit `filesystems.nix` by uncommenting the code and specifying what additional drives should get mounted automatically at startup.
 4. OPTIONALLY add something to `additional-configuration.nix` (none by default).
 5. OPTIONALLY add packages to `additional-packages.nix` (none by default).

With the new host ready you need to tell the system flake `flake.nix` about it. In `flake.nix` add a new line to `nixosConfiguration`:
```
examplehostname = setup "examplehostname";
```

Now for the home-manager. Create a directory `home/hosts/examplehostname`. Then
 1. Copy the `flake.nix` and `flake.lock` from any other `home/hosts/otherhostname` into it 
 2. In `home/hosts/examplehostname/flake.nix` find the variable `hostname = "otherhostname"` and change it to `hostname = "examplehostname"`.

After having completed these steps stash all the changes with `git add *`. Now you are ready to rebuild the system. Do
```
sudo nixos-rebuild switch --flake .#examplehostname
```
and afterwards
```
home-manager switch --flake ./home/hosts/examplehostname
```
Reboot for all the changes to apply. Start Hyprland simply by doing `hyprland`. Perhaps the resolution will be off, that is because Hyprland needs to be told which monitor to use (there is multi monitor support, but at the moment I don't know how it works). To see what options are available do
```
hyprctl monitors
```
You'll see something like
```
Monitor DP-2 (ID 0):
	2560x1440@143.85600 at 0x0
    ...
```
Go to `home/dotfiles/rice-folder/hyprland.conf` and put the name of your chosen monitor (in my example it is DP-2) into the line
```
#preliminaries
monitor=DP-2,preferred,auto,1
```
Logout with Super Esc and start Hyprland anew. Now you should be ready to go! The most important shortcuts are
 * Super Enter ~ Open terminal
 * Super E ~ Open file manager
 * Super R ~ Open applauncher
 * Super Q ~ Close window

### Updating
In order to update the system and packages available do
```
nix flake update
```
and then rebuild to actually update them.

### Cleaning up
Since NixOS stores all previous builds one may want to clean up older versions from time to time. To do this do
```
nh clean all --keep N
```
This will delete all previous versions except the N most recent.

## Rices

There are different looks available for the same set of programs. One can switch between looks by setting the relevant variable in `home.nix`.

### Fractal Rice
This is my main rice. I've create the fractal background images myself. The kitty window logo image is attributed to [Octopus Png PNGs by Vecteezy](https://www.vecteezy.com/free-png/octopus-png) with some color adjustments.

### City Rice
Transparent style with soft blue ui and a animated city background. Since the background video is large it is not included in the repo but must be manually downloaded and placed at `home/hosts/dotfiles/city-rice/backgrounds/city.mp4`. I've used [this video](https://moewalls.com/lifestyle/japan-summer-train-live-wallpaper/).
