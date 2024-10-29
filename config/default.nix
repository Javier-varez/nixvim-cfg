{ helpers, ... }:
{
  imports = [
    ./opts.nix
    ./colorscheme.nix
    ./autocmd.nix
    ./keymaps.nix
    ./plugins
  ];

  # Enable clipboard copy and pasting using xclip
  clipboard.providers.xclip.enable = true;
}
