{ config, pkgs, ... }:

{
#allows detecting optical drives
boot.kernelModules = [ "sg" ];
}
