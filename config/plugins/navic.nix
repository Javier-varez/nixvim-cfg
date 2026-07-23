{
  plugins = {
    navic = {
      enable = true;
      callSetup = true;
      settings = {
        # Automatically attach navic to any LSP client that supports
        # documentSymbols (including rust-analyzer via rustaceanvim).
        lsp = {
          auto_attach = true;
        };
        highlight = true;
      };
    };

    navbuddy = {
      enable = true;
      callSetup = true;
      settings = {
        lsp = {
          auto_attach = true;
        };
      };
    };
  };
}
