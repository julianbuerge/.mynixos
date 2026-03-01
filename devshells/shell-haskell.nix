{pkgs}:
pkgs.mkShell {
  packages = with pkgs; [
    ghc # compiler
    haskellPackages.cabal-install # build tool
  ];

  shellHook = ''
    echo "Haskell dev shell ready!"
    ghc --version
  '';
}
