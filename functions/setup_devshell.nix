{
  pkgs,
  shellname,
}: let
  shellpath = ../devshells/shell-${shellname}.nix;
in
  import shellpath {inherit pkgs;}
