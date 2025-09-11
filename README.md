# My NixOS
This is my personal NixOS setup as a Nix project which by its fully declarative nature makes the setup trivially reproducible.

Currently I have hardcoded the directory of this project to be in `$HOME/.mynixos`. Furthermore I use an Nvidia GPU and want to do CUDA computations. Therefore I install proprietary Nvidia drivers and configure mpv thusly. 

## Usage

### Setup
Assuming you are on a computer with NixOS installed, clone this repository to `$HOME/.mynixos`. Navigate into it. You will need to adjust some things in `hosts`.
 * Go to `hosts/names.nix` and set your host and user name.
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
You may need to logout and login or reboot for all the changes to apply. There is a configuration specific to me, namely, in `home/dotfiles/shared/git.nix` I set my user name and email. Please change these and then apply a home manager switch.

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
