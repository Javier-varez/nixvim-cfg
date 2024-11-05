{ lib, helpers, ... }:
{
  imports = [
    ./opts.nix
    ./colorscheme.nix
    ./autocmd.nix
    ./keymaps.nix
    ./plugins
  ];

  options = {
    useDdlnConfig = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Whether to use the Daedalean configuration (custom llvm) or not";
    };
  };

  config = {
    # Enable clipboard copy and pasting using xclip
    clipboard.providers.xclip.enable = true;
  };
}
