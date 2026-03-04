-- TODO: Debugging support
-- Set global varibale to determine the OS
_G.IS_LINUX = vim.loop.os_uname().sysname == "Linux"
_G.IS_WINDOWS = vim.loop.os_uname().sysname == "Windows_NT"

require('core.modules')
-- print(vim.inspect(_G.Functionalities))       -- for debugging modules
require('config.lazy')
require 'nvim-treesitter.install'.prefer_git = false
require('lazy').setup({ { 'nvim-treesitter/nvim-treesitter', build = 'TSUpdate' } })
require('core.conan')

-- disable netrw - WE USE OIL
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--faster updates for everything
vim.o.updatetime = 250

--better color, better life
vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "LspInlayHint", {
  fg = "#bb9af7", -- The Magenta/Purple
  bg = "#292e42", -- The "Pill" background
  italic = true,  -- Makes metadata look distinct
})

--activate linenumbers
vim.opt.nu = true

vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8

--disable linewrap
vim.opt.wrap = false

--tab should be 4 spaces and no more!
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smartindent = true

--no highlights after searching
vim.opt.incsearch = true
vim.opt.hlsearch = false

--active persistent undotree to replace neovim backups
vim.opt.backup = false
if IS_WINDOWS then
  vim.opt.undodir = os.getenv('USERPROFILE') ..
      '/.nvim/undodir'
elseif IS_LINUX then
  vim.opt.undodir = os.getenv('HOME') .. '/.local/share/nvim/undofile'
end

vim.opt.undofile = true
--remaps

--sets <SPACE> as mapleader(<leader>)
vim.g.mapleader = ' '

--<SPACE>e opens floating window with full error
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show full diagnostic message" })

--<SPACE>fe opens the Explorer
vim.keymap.set('n', '<leader>fe', ':Oil<CR>')

--<SPACE>ü opens the vimrc file for editing
vim.keymap.set('n', '<leader>o', ':e $MYVIMRC<CR>', { noremap = true, silent = true })

--Tabmaps
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-T>', ':tabclose<CR>', {noremap = true, silent = true}) taken out :q to be used

local fzf = require('fzf-lua')
-- find in files
vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Fzf find files' })

-- Search in Files
vim.keymap.set('n', '<leader>fs', fzf.live_grep, { desc = 'Fzf Live Grep (Literal or Regex)' })

-- Grep for the word currently under your cursor (Very handy)
vim.keymap.set('n', '<leader>fw', fzf.grep_cword, { desc = 'Grep word under cursor' })

--undotree map(this thing needs diff, which comes with git-windwos, but needs to be in the PATH)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle Undotree' })

--quick vsplit keybind
vim.keymap.set('n', '<leader>v', ':vsplit | wincmd l<CR>', { desc = 'Vertical split and focus' })
--Custom commands
vim.api.nvim_create_user_command("TabWidth4", function()
  vim.opt.tabstop = 4      -- Number of spaces a <Tab> in the file counts for
  vim.opt.shiftwidth = 4   -- Number of spaces for each step of (auto)indent
  vim.opt.expandtab = true -- Use spaces instead of tabs
  print("Tab width set to 4")
end, {})
