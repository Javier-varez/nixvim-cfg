{
  extraConfigLuaPost = ''
    -- Disable deprecated messages. There are a couple of plugins that use deprecated features of nvim,
    -- but the message gets pretty annoying every time they show up when you open the editor.
    -- Would be good to remember to re-check this on the next nix update.
    vim.deprecate = function() end

    -- Recently with nix 25.05, virtual text for error messages has stopped being shown inline.
    -- This overrides the diagnostics configuration to force-enable virtual_text.
    vim.diagnostic.config({
      virtual_lines = true
    })

    -- rust-analyzer has a tendency to scan all roots of the repository and find all relevant files.
    -- Unfortunately this can result in an observed "hang" if a directory like `.direnv` contains
    -- multiple gigabytes of files. This is the configuration for rustaceanvim to make sure that
    -- `.direnv` is ignored.
    vim.g.rustaceanvim = {
      -- LSP configuration
      server = {
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            ['files'] = {
              ['excludeDirs'] = {
                '.direnv'
              },
            },
          },
        },
      },
    }

    -- Allow us to use custom user config code without rebuilding nixvim
    -- this is handy for testing, even though less reproducible
    config_file = vim.fn.stdpath('config')..'/lua/custom_user.lua'
    if vim.uv.fs_stat(config_file) then
      require('custom_user')
    end
  '';
}
