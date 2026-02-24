return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling setup is optional for default settings
    require("fzf-lua").setup({
      -- You can choose different styles: 'dropdown', 'fzf-tmux', etc.
      winopts = {
        preview = {
          layout = 'vertical',
        },
      },
    })
  end
}
