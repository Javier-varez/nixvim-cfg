{ helpers, ... }:
{
  # Tell nvim where to store the undo files
  extraConfigLuaPre = ''
    local data_dir = vim.fn.stdpath('data')
    vim.o.undodir = data_dir..'/vimdid'
  '';


  autoCmd = [
    {
      event = [
        "BufRead"
        "BufNewFile"
      ];
      callback = helpers.mkRaw ''
        function()
          -- Enables the undo files
          vim.bo.undofile = true
          vim.bo.expandtab = true
          vim.bo.tabstop = 4
          vim.bo.shiftwidth = 4
        end
      '';
    }

    {
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = [
        "*.go"
        "Makefile"
        "makefile"
        "*.mk"
      ];
      command = "lua vim.bo.expandtab = false";
    }

    {
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = [ "COMMIT_EDITMSG" ];
      command = "vim.wo.colorcolumn = \"50,72\"";
    }

    {
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = "*.nix";
      callback = helpers.mkRaw ''
        function()
          vim.bo.tabstop = 2
          vim.bo.shiftwidth = 2
        end
      '';
    }
    {
      event = [
        "BufWritePre"
      ];
      pattern = [
        "*.cc"
        "*.hh"
        "*.h"
        "*.c"
        "*.cpp"
        "*.rs"
        "*.go"
      ];
      callback = helpers.mkRaw ''
        function(args)
          if vim.g.disable_autoformat then
            return
          end
          vim.lsp.buf.format()
        end
      '';
    }
  ];

  # Allow to enable/disable format on save
  extraConfigLuaPost = ''
    vim.g.disable_autoformat = false

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      vim.g.disable_autoformat = true
    end, {
      desc = "Disable format on save",
    })

    vim.api.nvim_create_user_command("FormatEnable", function(args)
      vim.g.disable_autoformat = false
    end, {
      desc = "Enable format on save",
    })
  '';
}
