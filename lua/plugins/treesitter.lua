local M = {
  'nvim-treesitter/nvim-treesitter',
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })()
  end,
  config = function()
    local configs = require('nvim-treesitter.config')
    local list = { 'lua', 'markdown' }
    if Functionalities.cpp then
      table.insert(list, 'c')
      table.insert(list, 'cpp')
      table.insert(list, 'cmake')
    end

    if Functionalities.python then
      table.insert(list, 'python')
    end

    if Functionalities.rust then
      table.insert(list, 'rust')
    end

    configs.setup({
      ensure_installed = list,
      ignore_install = { 'latex' },
      sync_install = false,
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

return { M }
