{
  config,
  lib,
  pkgs,
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
        config = {
          root_markers = [
            ".git"
            ".jj"
          ];
        };
      };

      rust-analyzer = {
        package = null;
      };

      clangd = {
        enable = true;
        package = lib.mkIf config.useDdlnLlvm extraPkgs.ddln-llvm-17;
        config = {
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
        config = {
          cmd = [ "gopls" ];
          filetypes = [ "go" ];
        };
      };

      nixd = {
        enable = true;
        config = {
          cmd = [
            "nixd"
            "--log=verbose"
          ];
          filetypes = [ "nix" ];

          config = {
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
        config = {
          cmd = [
            "ltex-ls-plus"
          ];
          filetypes = [
            "markdown"
          ];
          config = {
            ltex = {
              language = "en-US";
              languageToolHttpServerUri = "http://localhost:8875/";
            };
          };
        };
        package = pkgs.ltex-ls-plus;
      };

      verible = {
        enable = true;
        config = {
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
        config = {
          cmd = [ "cmake-language-server" ];
          filetypes = [ "cmake" ];
        };
      };

      jedi_language_server = {
        enable = true;
        config = {
          cmd = [ "jedi-language-server" ];
          filetypes = [ "python" ];
        };
      };

      dockerls = {
        enable = true;
        config = {
          cmd = [
            "docker-langserver"
            "--stdio"
          ];
          filetypes = [ "dockerfile" ];
        };
      };

      nushell = {
        enable = true;
        config = {
          cmd = [
            "nu"
            "--lsp"
          ];
          filetypes = [ "nu" ];
        };
      };

      zls = {
        enable = true;
        config = {
          cmd = [
            "zls"
          ];
          filetypes = [ "zig" ];
        };
      };

      lua_ls = {
        enable = true;
        config = {
          cmd = [
            "lua-language-server"
          ];
          filetypes = [ "lua" ];
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT";
              };
              diagnostics = {
                globals = [ "vim" ];
              };
              workspace = {
                checkThirdParty = false;
                library = [
                  (lib.nixvim.mkRaw "vim.env.VIMRUNTIME")
                  (lib.nixvim.mkRaw "vim.fn.stdpath('config')")
                ];
              };
            };
          };
        };
      };
    };
  };
}
