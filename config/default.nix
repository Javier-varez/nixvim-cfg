{ lib, config, ... }:
{
  imports = [
    ./autocmd.nix
    ./colorscheme.nix
    ./custom_lua.nix
    ./filetype.nix
    ./keymaps.nix
    ./lsp.nix
    ./opts.nix
    ./plugins
  ];

  options = {
    useDdlnLlvm = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Whether to use the Daedalean llvm fork or not";
    };

    enableDebugConfig = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Enables impure RTP so that one can use custom lua code for development without rebuilding nixvim";
    };
  };

  config = {
    # Enable clipboard copy and pasting using xclip
    clipboard.providers.xclip.enable = true;

    impureRtp = config.enableDebugConfig;

    performance.byteCompileLua = {
      enable = true;
      configs = true;
      initLua = true;
      luaLib = true;
      nvimRuntime = true;
      plugins = true;
    };
  };
}
