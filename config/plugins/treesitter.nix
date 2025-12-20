{ pkgs, ... }:
{
  plugins = {
    treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        cpp
        c
        rust
        go
        python
        latex
        lua
        make
        robot
        javascript
        vhdl
        systemverilog
        yaml
        json
        toml
        nix
        bash
        devicetree
        dockerfile
        diff
        fish
        pkgs.tree-sitter-grammars.tree-sitter-nu
      ];

      settings = {
        highlight = {
          enable = true;
        };

        # treesitter-based indentation
        indent.enable = true;
      };
    };
  };

  extraConfigLua = ''
    do
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.nu = {
        install_info = {
          url = "${pkgs.tree-sitter-grammars.tree-sitter-nu}",
          files = {"src/parser.c"},
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = "nu",
      }
    end
  '';

  # Add as extra plugins so that their `queries/{language}/*.scm` get
  # installed and can be picked up by `tree-sitter`
  extraPlugins = [
    pkgs.tree-sitter-grammars.tree-sitter-nu
  ];
}
