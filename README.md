# My NixOS
This is my personal NixOS setup as a Nix project which by its fully declarative nature makes the setup trivially reproducible. A short explanation as to how is in `manual`.

Currently I have hardcoded the directory of this project to be in `$HOME/.mynixos`. Furthermore I use an Nvidia GPU and want to do CUDA computations. Therefore I install proprietary Nvidia drivers and configure mpv thusly. 

## Rices

In the future different looks will be available for the same set of programs. One can switch between looks by setting the relevant variable in `home.nix` (not yet).

### Fractal Rice
We created the gtk-theme as well as the fractal background images ourselves. The kitty window logo image is [Octopus Png PNGs by Vecteezy](https://www.vecteezy.com/free-png/octopus-png) with some color adjustments.
