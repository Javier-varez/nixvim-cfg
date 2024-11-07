{
  pkgs,
  pkgsOld,
  ...
}:
let
  ltex-ls = pkgs.callPackage ./ltex-ls.nix { };
  ddln-llvm-14 = pkgsOld.callPackage ./llvm.nix {
    pkgs = pkgsOld;
    inherit (pkgsOld) stdenv targetPlatform;
  };
in
{
  inherit ddln-llvm-14;
  inherit ltex-ls;
}
