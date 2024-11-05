{
  description = "User nixvim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgsOld.url = "github:NixOS/nixpkgs/22.11";
  };

  outputs =
    { self, nixvim, nixpkgs, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs, system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};

          pkgsOld = import inputs.nixpkgsOld { inherit system; };
          extraPkgs = pkgs.callPackage ./pkgs { inherit pkgsOld; };

          nixvimModuleTemplate = { config }: {
            inherit pkgs;
            module = import config; # import the module directly

            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              inherit extraPkgs;
            };
          };
          nvimTemplate = { config }: nixvim'.makeNixvimWithModule (nixvimModuleTemplate { inherit config; });

          nvim = nvimTemplate { config = ./config; };
          nvim-ddln = nvimTemplate { config = ./config/ddln.nix; };
        in
        {
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNixvimModule (nixvimModuleTemplate { config = ./config; });
          };

          packages = {
            inherit nvim;
            inherit nvim-ddln;

            # Lets you run `nix run .` to start nixvim
            default = nvim;

            inherit (extraPkgs) ddln-llvm-14;
          };

        };

      flake = {
       nixosModules.nixvim = { pkgs, ... }: {
         environment.systemPackages = [ self.outputs.packages.${pkgs.system}.nvim ];
       };
      };
    };
}
