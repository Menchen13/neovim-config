local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local ts = require('nvim-treesitter')
    local list = { 'lua', 'markdown' }
    if Functionalities.cpp then
      table.insert(list, 'c')
      table.insert(list, 'cpp')
      table.insert(list, 'doxygen')
      table.insert(list, 'cmake')
    end

    if Functionalities.python then
      table.insert(list, 'python')
    end

    if Functionalities.rust then
      table.insert(list, 'rust')
    end

    if Functionalities.typst then
      table.insert(list, 'typst')
    end

    ts.install(list)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = list,
      callback = function() vim.treesitter.start() end,
    })
  end,
}

return { M }
