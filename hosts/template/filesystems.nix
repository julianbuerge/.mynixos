#these options will modify fstab.
{
  config,
  variables,
  ...
}: let
  inherit (variables) username;
in {
  /*
       If so desired, mount additional drives automatically

     fileSystems."/home/${username}/Data" = {

  device = "/dev/disk/by-uuid/PUT THE UUID IN ALL MINISCULE LETTERS HERE";
  fsType = "BUT THE TYPE HERE, E.G ext4";
  options = [ "nofail" "defaults" ];

     };

  */
}
