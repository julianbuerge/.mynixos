{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bat #visually appealing cat
    tealdeer #short version of man pages
    cowsay #fun
    asciiquarium #fun
    sl #fun
    cmatrix #fun
    tree #hierarchical ls
    fastfetch #show system info
    unzip #archive extractor
  ];
}
