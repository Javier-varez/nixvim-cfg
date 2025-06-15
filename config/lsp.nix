{
  config,
  lib,
  extraPkgs,
  ...
}:
{
  lsp = {
    keymaps = [
      {
        key = "<space>e";
        action = lib.nixvim.mkRaw "vim.diagnostic.open_float";
      }
      {
        key = "K";
        lspBufAction = "hover";
      }
      {
        key = "gD";
        lspBufAction = "declaration";
      }
      {
        key = "gd";
        lspBufAction = "definition";
      }
      {
        key = "gr";
        lspBufAction = "references";
      }
      {
        key = "gi";
        lspBufAction = "implementation";
      }
      {
        key = "gt";
        lspBufAction = "type_definition";
      }
      {
        key = "<space>rn";
        lspBufAction = "rename";
      }
      {
        key = "<space>ca";
        lspBufAction = "code_action";
      }
      {
        key = "<C-k>";
        lspBufAction = "signature_help";
      }
      {
        key = "<space><space>f";
        lspBufAction = "format";
      }
    ];

    servers = {
      "*" = {
        settings = {
          root_markers = [
            ".git"
            ".jj"
          ];
        };
      };

      clangd = {
        enable = true;
        package = lib.mkIf config.useDdlnConfig extraPkgs.ddln-llvm-17;
        settings = {
          cmd = [
            "clangd"
            "--query-driver=**/*"
          ];
          filetypes = [
            "c"
            "cpp"
          ];
          root_markers = [
            ".clang-format"
            "compile_commands.json"
            ".git"
            ".jj"
          ];
          capabilities = {
            textDocument.completion.completionItem.snippetSupport = true;
          };
        };
      };

      gopls = {
        enable = true;
        settings = {
          cmd = [ "gopls" ];
          filetypes = [ "go" ];
        };
      };

      nixd = {
        enable = true;
        settings = {
          cmd = [
            "nixd"
            "--log=verbose"
          ];
          filetypes = [ "nix" ];

          settings = {
            formatting = {
              command = [ "nixfmt" ];
              blah = "blu";
            };

            nixpkgs = {
              expr = "import <nixpkgs> {}";
            };
          };
        };
      };

      ltex = {
        enable = true;
        settings = {
          cmd = [
            "ltex-ls"
          ];
          filetypes = [
            "markdown"
          ];
          settings = {
            ltex = {
              language = "en-US";
              languageToolHttpServerUri = "http://localhost:8875/";
            };
          };
        };
        package = extraPkgs.ltex-ls;
      };

      verible = {
        enable = true;
        settings = {
          cmd = [
            "verible-verilog-ls"
            "--rules_config_search"
            "--indentation_spaces=4"
          ];
          filetypes = [
            "verilog"
            "systemverilog"
          ];
        };
      };

      cmake = {
        enable = true;
        settings = {
          cmd = [ "cmake-language-server" ];
          filetypes = [ "cmake" ];
        };
      };

      jedi_language_server = {
        enable = true;
        settings = {
          cmd = [ "jedi-language-server" ];
          filetypes = [ "python" ];
        };
      };

      dockerls = {
        enable = true;
        settings = {
          cmd = [
            "docker-langserver"
            "--stdio"
          ];
          filetypes = [ "dockerfile" ];
        };
      };

      nushell = {
        enable = true;
        settings = {
          cmd = [
            "nu"
            "--lsp"
          ];
          filetypes = [ "nu" ];
        };
      };

      zls = {
        enable = true;
        settings = {
          cmd = [
            "zls"
          ];
          filetypes = [ "zig" ];
        };
      };
    };
  };
}
