{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  plugins = {
    lualine = {
      enable = true;
      settings = {
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [
            "branch"
            "diff"
            "diagnostics"
          ];
          lualine_c = [ "filename" ];
          lualine_x = [
            "encoding"
            "fileformat"
            "filetype"
          ];
          lualine_y = [ "progress" ];
          lualine_z = [
            "location"
            "selectioncount"
          ];
        };
        winbar = {
          lualine_c = mkRaw ''
            {
              {
                -- Enable navic in the current window bar
                function() return require('nvim-navic').get_location() end,
                cond = function() return require('nvim-navic').is_available() end,
              },
            }
          '';
        };
      };
    };
  };
}
