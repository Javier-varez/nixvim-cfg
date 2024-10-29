{
  plugins = {
    lsp = {
      enable = true;

      keymaps = {
        diagnostic = {
          "<space>e" = "open_float";
        };
        lspBuf = {
          "K" = "hover";
          "gD" = "declaration";
          "gd" = "definition";
          "gr" = "references";
          "gi" = "implementation";
          "<space>rn" = "rename";
          "<space>ca" = "code_action";
          "<C-k>" = "signature_help";
          "<space><space>f" = "format";
        };
      };
      servers = {
        clangd.enable = true;
        gopls = {
          enable = true;
          autostart = true;
        };
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        nixd = {
          enable = true;
          settings = {
            formatting = {
              command = [ "nixfmt" ];
            };
            nixpkgs = {
              expr = "import <nixpkgs> {}";
            };
          };
        };
      };
    };
  };
}
