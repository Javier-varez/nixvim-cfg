{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  colorschemes = {
    tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };
  };

  globals = {
    mapleader = " ";
  };

  opts = {
    number = true;
    relativenumber = true;
    list = true;
    scrolloff = 8;
  };

  keymaps = [
    {
      mode = "i";
      key = "jj";
      action = "<Esc>";
    }
    {
      mode = "n";
      key = "<leader>w";
      action = "<Cmd>w<CR>";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<Cmd>q<CR>";
    }
    {
      mode = "n";
      key = "<leader>Q";
      action = "<Cmd>!q<CR>";
    }
  ];
}
