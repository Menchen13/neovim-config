if not Functionalities.typst then
  return {}
end

local tinymistBinary = vim.fn.stdpath 'data' .. '/mason/bin/tinymist'
    tinymistBinary = tinymistBinary .. '.cmd'

return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  keys = {
    {
      "<leader>t",
      function()
        vim.cmd("TypstPreviewToggle")
      end,
      desc = "Toggle typst-preview"
    }
  },
  opts = {
    dependencies_bin = {
      tinymist = tinymistBinary,
      websocat = nil
    },
  }, -- lazy.nvim will implicitly calls `setup {}`
}
