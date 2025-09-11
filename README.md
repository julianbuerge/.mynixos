# My NixOS
This is my personal NixOS setup as a Nix project which by its fully declarative nature makes the setup trivially reproducible.

As my basic environment I use hyprland (wayland tiling window manager) with waybar (status bar for wayland) and wofi (app launcher for wayland).

The heart piece of my workflow is kitty (terminal) with neovim (text editor) for programming and creating nice text documents with LaTeX.


## Usage

### Setup
Assuming you are on a computer with NixOS and with git installed, clone this repository to `$HOME/.mynixos`. Navigate into it. You will need to adjust some things in `hosts`.
 * Go to `hosts/variables.nix` and set your hostname, name, username, git username and email, and whether or not you use an nvidia GPU.
 * Create a directory `hosts/hostname` where `hostname` is the same as the one you just set.
 * Copy `/etc/nixos/hardware-configuration.nix` into `hosts/hostname`.
 * Create `hosts/filesystems.nix` (or copy one from the other hosts). There you can specify what additional drives should get mounted automatically at startup. If you don't want this you can make the output be only `{ }` with nothing in it.

After having completed these steps stash all the changes with `git add *`. Now you are ready to rebuild the system. Do
```
sudo nixos-rebuild switch --flake .#nixos
```
and afterwards
```
home-manager switch --flake ./home
```
You may need to logout and login or reboot for all the changes to apply. Now that everything is installed there remains one thing to configure: Hyprland needs to be told which monitor to use. Each of my rice folders has it set to the correct option with regards to the device I use that rice on. To see what option are available on your device do
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
Finally start hyprland with the command `hyprland`. The most important shortcuts are
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

### Laptop Rice
Currently the same as the fractal rice with some adapted scaling to fit a smaller screen (resolution).
