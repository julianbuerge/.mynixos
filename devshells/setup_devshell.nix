{
  pkgs,
  shellname,
}: let
  shellpath = ./shell-${shellname}.nix;
in
  import shellpath {inherit pkgs;}
