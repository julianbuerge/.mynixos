#these options will modify fstab.
{
  config,
  variables,
  ...
}: let
  inherit (variables) username;
in {
}
