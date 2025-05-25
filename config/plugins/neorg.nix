{
  plugins = {
    neorg = {
      enable = true;
      settings.load = {
        "core.defaults" = {
          __empty = null;
        };
        "core.concealer" = {
          config = {
            icon_preset = "diamond";
            icons = {
              code_block = {
                conceal = true;
                content_only = true;
                width = "content";
              };
            };
          };
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
