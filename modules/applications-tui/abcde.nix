{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    abcde #cd reading program
  ];
}
