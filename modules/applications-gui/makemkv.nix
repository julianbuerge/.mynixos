{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    makemkv #program to make mkv files
  ];
}
