{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  colorschemes = {
    tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };
  };

  globals = {
    mapleader = " ";
  };

  opts = {
    number = true;
    relativenumber = true;
    colorcolumn = "80,100";
    scrolloff = 8;

    list = true;
    listchars = "eol:↵,trail:~,tab:>-,nbsp:␣";

    hlsearch = true;
    hidden = true;
    errorbells = false;
    swapfile = false;
    backup = false;
    mouse = "a";
  };

  plugins = {
    undotree.enable = true;
    telescope.enable = true;
    commentary.enable = true;
    gitgutter.enable = true;
    trim.enable = true;
    nvim-tree.enable = true;
    oil.enable = true;
    treesitter.enable = true;
    lazygit.enable = true;
    notify = {
      enable = true;
      backgroundColour = "#1e1e2e";
      fps = 60;
      render = "default";
      timeout = 500;
      topDown = true;
    };
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };
    noice.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "fish"; }
          { name = "buffer"; }
        ];

        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-e>" = "cmp.mapping.close()";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
        };
      };
    };

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
        rust-analyzer = {
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

  keymaps = [
    { mode = "n"; key = "<Up>"; action = "<Nop>"; }
    { mode = "n"; key = "<Down>"; action = "<Nop>"; }
    { mode = "n"; key = "<Left>"; action = "<Cmd>BufferLineCyclePrev<CR>"; }
    { mode = "n"; key = "<Right>"; action = "<Cmd>BufferLineCycleNext<CR>"; }
    { mode = "n"; key = "<C-h>"; action = "<Cmd>BufferLineCyclePrev<CR>"; }
    { mode = "n"; key = "<C-l>"; action = "<Cmd>BufferLineCycleNext<CR>"; }
    { mode = "n"; key = "<C-Left>"; action = "<Cmd>BufferLineCyclePrev<CR>"; }
    { mode = "n"; key = "<C-Right>"; action = "<Cmd>BufferLineCycleNext<CR>"; }
    { mode = "i"; key = "jj"; action = "<Esc>"; }
    { mode = "n"; key = "<leader>w"; action = "<Cmd>w<CR>"; }
    { mode = "n"; key = "<leader>q"; action = "<Cmd>q<CR>"; }
    { mode = "n"; key = "<leader>Q"; action = "<Cmd>qall!<CR>"; }
    { mode = "n"; key = "<leader>u"; action = "<Cmd>UndoTreeToggle<CR>"; }
    { mode = "n"; key = "<leader>ps"; action = "<Cmd>Telescope live_grep<CR>"; }
    { mode = "n"; key = "<leader>ff"; action = "<Cmd>Telescope find_files<CR>"; }
    { mode = "n"; key = "<leader>d"; action = "<Cmd>bd<CR>"; }
    { mode = "n"; key = "<leader>t"; action = "<Cmd>tabe<CR><Cmd>terminal<CR>"; }
    { mode = "i"; key = ","; action = ",<C-g>u"; }
    { mode = "i"; key = ";"; action = ";<C-g>u"; }
    { mode = "n"; key = "<leader>n"; action = "<Cmd>NvimTreeToggle<CR>"; }
  ];
}
