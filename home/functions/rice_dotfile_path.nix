{variables}: let
  rice = variables.rice;
in
  dotfile: ../dotfiles/${rice} + "/${dotfile}"
