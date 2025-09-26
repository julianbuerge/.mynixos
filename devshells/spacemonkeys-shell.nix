{ pkgs }:

pkgs.mkShell {
    packages = with pkgs; [
        gcc #c++ compiler
        gnumake #make
        sfml_2 #simple and fast multimedia library version 2
        pkg-config #allows packages to communicate
    ];
}

