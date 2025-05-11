{
  plugins = {
    neorg = {
      enable = true;
      modules = {
        "core.defaults" = {
          __empty = null;
        };
        "core.concealer" = {
          __empty = null;
        };
        "core.export" = {
          __empty = null;
        };
        "core.export.markdown" = {
          __empty = null;
        };
        "core.summary" = {
          __empty = null;
        };
        "core.dirman" = {
          config = {
            workspaces = {
              sw = "~/notes/sw";
              fpga = "~/notes/fpga";
            };
            default_workspace = "sw";
          };
        };
      };
    };
  };
}
