{ config, lib, extraPkgs, helpers, ... }: {
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
          "gt" = "type_definition";
          "<space>rn" = "rename";
          "<space>ca" = "code_action";
          "<C-k>" = "signature_help";
          "<space><space>f" = "format";
        };
      };

      servers = {
        clangd = {
          enable = true;
          package = lib.mkIf config.useDdlnConfig extraPkgs.ddln-llvm-17;
        };

        gopls = {
          enable = true;
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

        lua_ls = {
          enable = true;
          extraOptions = helpers.mkRaw ''{
            settings = {
              -- Note that this table has to exist, or `on_init` will not be able to extend it.
              Lua = {};
            },
            on_init = function(client, initialize_result)
              if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
                  return
                end
              end

              client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                  -- Tell the language server which version of Lua you're using
                  -- (most likely LuaJIT in the case of Neovim)
                  version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "$3rd/luv/library"
                    -- "$3rd/busted/library",
                  }
                  -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                  -- library = vim.api.nvim_get_runtime_file("", true)
                }
              })
            end
          }'';
        };

        cmake = {
          enable = true;
        };

        dockerls = {
          enable = true;
        };

        jedi_language_server = {
          enable = true;
        };

        html = {
          enable = true;
        };

        nushell = {
          enable = true;
        };

        zls = {
          enable = true;
        };

        ltex = {
          enable = true;
          settings = {
            ltex = {
              language = "en-US";
              languageToolHttpServerUri = "http://localhost:8875/";
            };
          };
          package = extraPkgs.ltex-ls;
        };

      };
    };
  };
}
