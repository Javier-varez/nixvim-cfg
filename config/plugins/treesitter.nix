{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
        };
        ensure_installed = [
          "cpp"
          "c"
          "rust"
          "go"
          "python"
          "latex"
          "lua"
          "make"
          "robot"
          "javascript"
          "vhdl"
          "verilog"
          "yaml"
          "json"
          "toml"
          "nix"
          "bash"
          "devicetree"
          "dockerfile"
          "diff"
          "fish"
        ];

        # treesitter-based indentation
        indent.enable = true;
      };
    };
  };
}
