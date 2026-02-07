{pkgs, ...}: {
  #this fixes the following bug: https://github.com/nix-community/home-manager/issues/3113
  home.packages = [pkgs.dconf];
}
