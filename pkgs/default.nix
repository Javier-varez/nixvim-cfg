{
  pkgs,
  system,
  pkgsOld,
  ...
}:
let
  ddln-llvm-14 = pkgsOld.callPackage ./llvm.nix { pkgs = pkgsOld; inherit (pkgsOld) stdenv targetPlatform; };
in
  {
    inherit ddln-llvm-14;
  }
