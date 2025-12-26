{
  pkgs,
  ...
}:
{
  ddln-llvm-17 = pkgs.callPackage ./llvm.nix { };
}
