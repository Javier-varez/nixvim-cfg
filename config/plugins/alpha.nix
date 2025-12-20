{ lib, ... }:
{
  plugins = {
    alpha = {
      enable = true;
      settings = {
        opts = {
          margin = 10;
        };
        layout = [
          {
            type = "padding";
            val = 2;
          }
          {
            opts = {
              hl = "Type";
              position = "center";
            };
            type = "text";
            val = [
              "      ___           ___           ___           ___                       ___     "
              "     /\\__\\         /\\  \\         /\\  \\         /\\__\\          ___        /\\__\\    "
              "    /::|  |       /::\\  \\       /::\\  \\       /:/  /         /\\  \\      /::|  |   "
              "   /:|:|  |      /:/\\:\\  \\     /:/\\:\\  \\     /:/  /          \\:\\  \\    /:|:|  |   "
              "  /:/|:|  |__   /::\\~\\:\\  \\   /:/  \\:\\  \\   /:/__/  ___      /::\\__\\  /:/|:|__|__ "
              " /:/ |:| /\\__\\ /:/\\:\\ \\:\\__\\ /:/__/ \\:\\__\\  |:|  | /\\__\\  __/:/\\/__/ /:/ |::::\\__\\"
              " \\/__|:|/:/  / \\:\\~\\:\\ \\/__/ \\:\\  \\ /:/  /  |:|  |/:/  / /\\/:/  /    \\/__/~~/:/  /"
              "     |:/:/  /   \\:\\ \\:\\__\\    \\:\\  /:/  /   |:|__/:/  /  \\::/__/           /:/  / "
              "     |::/  /     \\:\\ \\/__/     \\:\\/:/  /     \\::::/__/    \\:\\__\\          /:/  /  "
              "     /:/  /       \\:\\__\\        \\::/  /       ~~~~         \\/__/         /:/  /   "
              "     \\/__/         \\/__/         \\/__/                                   \\/__/    "
            ];
          }
          {
            type = "padding";
            val = 2;
          }
          {
            type = "group";
            opts = {
              spacing = 1;
              "inherit" = {
                position = "center";
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            };
            val = [
              {
                on_press = lib.nixvim.mkRaw "function() vim.cmd('enew') end";
                opts = {
                  cursor = 0;
                  shortcut = "n";
                  keymap = [
                    "n"
                    "n"
                    "<cmd>enew<cr>"
                  ];
                };
                type = "button";
                val = "  ✏️  New file";
              }
              {
                on_press = lib.nixvim.mkRaw "function() vim.cmd('Telescope live_grep') end";
                opts = {
                  cursor = 0;
                  shortcut = "s";
                  keymap = [
                    "n"
                    "s"
                    "<cmd>Telescope live_grep<cr>"
                  ];
                };
                type = "button";
                val = "  🔭  Search project files";
              }
              {
                on_press = lib.nixvim.mkRaw "function() vim.cmd('Telescope find_files') end";
                opts = {
                  cursor = 0;
                  shortcut = "f";
                  keymap = [
                    "n"
                    "f"
                    "<cmd>Telescope find_files<cr>"
                  ];
                };
                type = "button";
                val = "  🔍  Find files";
              }
              {
                on_press = lib.nixvim.mkRaw "function() vim.cmd('Telescope help_tags') end";
                opts = {
                  cursor = 0;
                  shortcut = "h";
                  keymap = [
                    "n"
                    "h"
                    "<cmd>Telescope help_tags<cr>"
                  ];
                };
                type = "button";
                val = "  🚑  Search help";
              }
              {
                on_press = lib.nixvim.mkRaw "function() vim.cmd('qa') end";
                opts = {
                  cursor = 0;
                  shortcut = "q";
                  keymap = [
                    "n"
                    "q"
                    "<cmd>qa<cr>"
                  ];
                };
                type = "button";
                val = "  ❌  Quit Neovim";
              }
            ];
          }
          {
            type = "padding";
            val = 2;
          }
          {
            opts = {
              hl = "Keyword";
              position = "center";
            };
            type = "text";
            val = "Controlling complexity is the essence of computer programming.";
          }
          {
            opts = {
              hl = "Keyword";
              position = "center";
            };
            type = "text";
            val = "- Brian Kernighan";
          }
        ];
      };
    };
  };
}
