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
  #mount my backup & games drive
  fileSystems."/home/${username}/GamesAndBackups" = {
    device = "/dev/disk/by-uuid/a05c41da-9ff8-45c1-91d4-a251ef0653d0";
    fsType = "ext4";
    options = ["nofail" "defaults"];
  };
}
