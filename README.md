# My NixOS
This is my personal NixOS setup as a Nix project which by its fully declarative nature makes the setup trivially reproducible.

As my base environment I use hyprland (wayland tiling window manager) with waybar (status bar for wayland) and wofi (app launcher for wayland).

The heart piece of my workflow is kitty (terminal) with neovim (text editor) for programming and creating nice text documents with LaTeX.


## Usage

### Setup
Assuming you are on a computer with NixOS and with git installed, clone this repository to `$HOME/.mynixos`. Navigate into it. You will need to create a new directory in `hosts` which specifies things specific to your machine (i.e. your host).
 * Create a directory `hosts/hostname` where `hostname` is the name you want your machine to have. You will need to put all the same files that the other hosts have into that directory
    1. `host.nix` can be copied over from any of the other hosts. No changes needed here.
    2. `variables.nix` can be copied over from any of the other hosts. Adapt username, git username and email, and whether or not you use an nvidia GPU.
    3. `hardware-configuration.nix` should be copied over from `/etc/nixos/hardware-configuration.nix`, which is the hardware configuration that NixOS automatically created during install. 
    4. `filesystems.nix` can be copied over from any of the other hosts. There you can specify what additional drives should get mounted automatically at startup. If you don't want this you can make the output be only `{ }` with nothing in it.
With the new host ready we need to tell the system flake `flake.nix` and the home-manager flake `home/flake.nix` about it.
 1. In `flake.nix` add a new line 
 ```
 examplehostname = setup "examplehostname" 
 ```
 to `nixosConfiguration`.
 2. In `home/flake.nix` find the variable `hostname = "..."` and simply change it to `hostname = "examplehostname"`.

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
