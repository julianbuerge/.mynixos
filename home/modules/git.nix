{variables, ...}: {
  #configure git in the nix language
  programs.git = {
    enable = true;

    settings = {
      user.name = variables.gitusername;
      user.email = variables.gitemail;

      core.editor = "nvim";
      init.defaultBranch = "main";
      advice.addIgnoredFile = "false";
    };
  };
}
