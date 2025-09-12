# My NixOS
This is my personal NixOS setup as a Nix project which by its fully declarative nature makes the setup trivially reproducible.

As my base environment I use hyprland (wayland tiling window manager) with waybar (status bar for wayland) and wofi (app launcher for wayland).

The heart piece of my workflow is kitty (terminal) with neovim (text editor) for programming and creating nice text documents with LaTeX.


## Usage

### Setup
Assuming you are on a computer with NixOS and with git installed, clone this repository to `$HOME/.mynixos`. Navigate into it. You will need adapt the configuration to use your computer as a new host, both on for the system and home-manager flake. 

First on a system level. Create a directory `hosts/examplehostname` where `examplehostname` is the name you want your machine to have. You will need to put all the same files that the other hosts have into that directory:
    1. `host-configuration.nix` can be copied over from any of the other hosts. No changes needed here.
    2. `variables.nix` can be copied over from any of the other hosts. Adapt host- and username, git username and email, and whether or not you use an nvidia GPU. You can also choose which rice you want to use (has to be any of `home/dotfiles/rice-folder`).
    3. `hardware-configuration.nix` should be copied over from `/etc/nixos/hardware-configuration.nix`, which is the hardware configuration that NixOS automatically created during install. 
    4. `filesystems.nix` can be copied over from any of the other hosts. There you can specify what additional drives should get mounted automatically at startup. If you don't want this you can make the output be only `{ }` with nothing in it.

With the new host ready you need to tell the system flake `flake.nix` about it.
 * In `flake.nix` add a new line to `nixosConfiguration`:
    ```
    examplehostname = setup "examplehostname";
    ```
Now for the home-manager. Create a directory `home/hosts/examplehostname`. Then
 1. Copy the `flake.nix` and `flake.lock` from any other `home/hosts/otherhostname` into it 
 2. Find the variable `hostname = "otherhostname"` and change it to `hostname = "examplehostname"`.

After having completed these steps stash all the changes with `git add *`. Now you are ready to rebuild the system. Do
```
sudo nixos-rebuild switch --flake .#examplehostname
```
and afterwards
```
home-manager switch --flake ./home
```
Reboot for all the changes to apply. Start hyprland simply by doing `hyprland`. Perhaps the resolution will be off, that is because hyprland needs to be told which monitor to use (there is multi monitor support, but at the moment I don't know how it works). To see what options are available on do
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
Logout with Super Esc and start hyprland anew. Now you should be ready to go! The most important shortcuts are
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
