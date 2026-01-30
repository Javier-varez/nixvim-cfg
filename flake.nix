{
  description = "User nixvim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    {
      self,
      nixvim,
      flake-parts,
      ...
    }@inputs:
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

          extraPkgs = pkgs.callPackage ./pkgs { };

          nixvimModuleTemplate = overrides: {
            inherit pkgs;
            module =
              { ... }:
              {
                imports = [ ./config ];
              }
              // overrides;

            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              inherit extraPkgs;
              inherit (pkgs.stdenv) isDarwin;
            };
          };
          nvimTemplate = overrides: nixvim'.makeNixvimWithModule (nixvimModuleTemplate overrides);

        in
        {
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNixvimModule (nixvimModuleTemplate {
            });
          };

          packages = rec {
            nvim = nvimTemplate { };
            nvim-ddln = nvimTemplate { config.useDdlnLlvm = true; };
            nvim-dev = nvimTemplate { config.enableDebugConfig = true; };

            # Lets you run `nix run .` to start nixvim
            default = nvim;

            inherit (extraPkgs) ddln-llvm-14 ltex-ls;
          };

        };

      flake = {
        nixosModules.nixvim =
          { pkgs, ... }:
          {
            environment.systemPackages = [ self.outputs.packages.${pkgs.system}.nvim ];
          };
      };
    };
}
