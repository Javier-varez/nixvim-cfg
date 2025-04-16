{
  description = "User nixvim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgsOld.url = "github:NixOS/nixpkgs/22.11";

    zig-asahi.url = "github:javier-varez/zig-asahi";
    zig-asahi.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self, nixvim, flake-parts, zig-asahi, ... }@inputs:
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

          asahiPkgs = inputs.nixpkgs.legacyPackages.${system}.extend zig-asahi.overlays.zig-asahi;

          nixvimModuleTemplate = { config }: {
            inherit pkgs;
            module = import config; # import the module directly

            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              inherit extraPkgs;
              inherit asahiPkgs;
            };
          };
          nvimTemplate = { config }: nixvim'.makeNixvimWithModule (nixvimModuleTemplate { inherit config; });

          nvim = nvimTemplate { config = ./config; };
          nvim-ddln = nvimTemplate { config = ./config/ddln.nix; };
          nvim-asahi = nvimTemplate { config = ./config/asahi.nix; };
        in
        {
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNixvimModule (nixvimModuleTemplate { config = ./config; });
          };

          packages = {
            inherit nvim;
            inherit nvim-ddln;
            inherit nvim-asahi;

            # Lets you run `nix run .` to start nixvim
            default = nvim;

            inherit (extraPkgs) ddln-llvm-14 ltex-ls;
          };

        };

      flake = {
       nixosModules.nixvim = { pkgs, ... }: {
         environment.systemPackages = [ self.outputs.packages.${pkgs.system}.nvim ];
       };

       nixosModules.nixvim-asahi = { pkgs, ... }: {
         environment.systemPackages = [ self.outputs.packages.${pkgs.system}.nvim-asahi ];
       };
      };
    };
}
