{
  pkgs,
  ...
}:
let
  ltex-ls = pkgs.callPackage ./ltex-ls.nix { };
  ddln-llvm-14 = pkgs.callPackage ./llvm.nix { };
in
{
  inherit ddln-llvm-14;
  inherit ltex-ls;
}
