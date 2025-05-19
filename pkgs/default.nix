{
  pkgs,
  ...
}:
let
  ltex-ls = pkgs.callPackage ./ltex-ls.nix { };
  ddln-llvm-17 = pkgs.callPackage ./llvm.nix { };
in
{
  inherit ddln-llvm-17;
  inherit ltex-ls;
}
