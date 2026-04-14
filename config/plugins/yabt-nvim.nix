{
  pkgs,
  lib,
  config,
  ...
}:
let
  enablePlugin = !config.enableDebugConfig;
in
{
  extraPlugins = lib.mkIf enablePlugin [
    (pkgs.vimUtils.buildVimPlugin {
      name = "yabt-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "javier-varez";
        repo = "yabt-nvim";
        rev = "d10da7aee762bfd3e55bc505bad8103fdadec557";
        hash = "sha256-jMHRr/HxDFxv4+lSiQVCO7SxWCOgQFcfIV3AWtiU0yk=";
      };
    })
  ];

  extraConfigLua = lib.mkIf enablePlugin ''
    require'yabt-nvim'.setup {
      lua_ls = "${pkgs.lua-language-server}/bin/lua-language-server"
    }
  '';
}
