{ lib, helpers, ... }:
{
  imports = [
    ./opts.nix
    ./colorscheme.nix
    ./autocmd.nix
    ./keymaps.nix
    ./plugins
    ./filetype.nix
  ];

  options = {
    useDdlnConfig = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Whether to use the Daedalean configuration (custom llvm) or not";
    };

    isAsahiLinux = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Whether we are building nvim for asahi linux or not (to patch certain packages like zls).";
    };
  };

  config = {
    # Enable clipboard copy and pasting using xclip
    clipboard.providers.xclip.enable = true;
  };
}
