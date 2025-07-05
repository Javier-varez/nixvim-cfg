{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "dbt-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "javier-varez";
        repo = "dbt-nvim";
        rev = "ed9b73547b2f056e8043e5817a6451f9a01e74f1";
        hash = "sha256-E26MkAontZghseCgOr/rbYE4DdshuD4HUa/Sp7yP3L0=";
      };
    })
  ];

  extraConfigLua = "require'dbt-nvim'.setup {}";
}
