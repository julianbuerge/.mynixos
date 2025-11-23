#these options will modify fstab.
{
  config,
  variables,
  ...
}: let
  inherit (variables) username;
in {
     fileSystems."/home/${username}/Data" = {

  device = "/dev/disk/by-uuid/85a8b976-a480-451e-af3d-402530bce3d6";
  fsType = "ext4";
  options = [ "nofail" "defaults" ];

     };

}
