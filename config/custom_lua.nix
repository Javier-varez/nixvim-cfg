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
  '';
}
