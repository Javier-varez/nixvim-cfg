{
  pkgs,
  ...
}:
let
  ddln-llvm-17 = pkgs.callPackage ./llvm.nix { };
in
{
  inherit ddln-llvm-17;
}
