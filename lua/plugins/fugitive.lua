if not Functionalities.git then
  return {}
end

return {
    'tpope/vim-fugitive',
    keys = {
        {
            '<leader>g',
            function()
                vim.cmd('Git')
            end,
            desc = 'Open Git-Menu'
        }
    }
}
