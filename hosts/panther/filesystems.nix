#these options will modify fstab.
{
  config,
  variables,
  ...
}: let
  inherit (variables) username;
in {
  #mount my data drive
  fileSystems."/home/${username}/Data" = {
    device = "/dev/disk/by-uuid/b2c7a814-a946-4e20-aa63-4f23d1b06a25";
    fsType = "ext4";
    options = ["nofail" "defaults"];
  };
  #mount my media library drive
  fileSystems."/home/${username}/MediaLibrary" = {
    device = "/dev/disk/by-uuid/0b570c9e-035a-4518-ac1b-40cdcee6eb1e";
    fsType = "ext4";
    options = ["nofail" "noatime" "defaults"];
  };
  #mount my backup HDD
  fileSystems."/home/${username}/Backups" = {
    device = "/dev/disk/by-uuid/44bba7f1-bfc5-431a-8114-d8d143814f08";
    fsType = "ext4";
    options = ["nofail" "defaults"];
  };
}
