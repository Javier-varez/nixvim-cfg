{
  # Lets treat bluespec verilog as plain verilog...
  extraConfigLua = ''
    vim.filetype.add({
      pattern = {
        ['.*\\.bsv'] = 'verilog',
      }
    })
  '';
}
