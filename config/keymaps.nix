{
  keymaps = [
    {
      mode = "n";
      key = "<Up>";
      action = "<Nop>";
    }
    {
      mode = "n";
      key = "<Down>";
      action = "<Nop>";
    }
    {
      mode = "n";
      key = "<Left>";
      action = "<Cmd>BufferLineCyclePrev<CR>";
    }
    {
      mode = "n";
      key = "<Right>";
      action = "<Cmd>BufferLineCycleNext<CR>";
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<Cmd>BufferLineCyclePrev<CR>";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<Cmd>BufferLineCycleNext<CR>";
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = "<Cmd>BufferLineCyclePrev<CR>";
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<Cmd>BufferLineCycleNext<CR>";
    }
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
      action = "<Cmd>qall!<CR>";
    }
    {
      mode = "n";
      key = "<leader>u";
      action = "<Cmd>UndotreeToggle<CR>";
    }
    {
      mode = "n";
      key = "<leader>ps";
      action = "<Cmd>Telescope live_grep<CR>";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<Cmd>Telescope find_files<CR>";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<Cmd>Telescope oldfiles<CR>";
    }
    {
      mode = "n";
      key = "<leader>ss";
      action = "<Cmd>Telescope spell_suggest<CR>";
    }
    {
      mode = "n";
      key = "<leader>d";
      action = "<Cmd>bd<CR>";
    }
    {
      mode = "n";
      key = "<leader>t";
      action = "<Cmd>tabe<CR><Cmd>terminal<CR>";
    }
    {
      mode = "i";
      key = ",";
      action = ",<C-g>u";
    }
    {
      mode = "i";
      key = ";";
      action = ";<C-g>u";
    }
    {
      mode = "n";
      key = "<leader>n";
      action = "<Cmd>NvimTreeToggle<CR>";
    }
    # Window management
    {
      mode = "n";
      key = "<A-h>";
      action = "<C-w>h";
    }
    {
      mode = "n";
      key = "<A-j>";
      action = "<C-w>j";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<C-w>k";
    }
    {
      mode = "n";
      key = "<A-l>";
      action = "<C-w>l";
    }
    {
      mode = "n";
      key = "<A-c>";
      action = "<C-w>c";
    }
    {
      mode = "n";
      key = "<A-v>";
      action = "<C-w>v";
    }
    {
      mode = "n";
      key = "<A-s>";
      action = "<C-w>s";
    }
  ];
}
