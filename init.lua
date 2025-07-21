-- TODO: Debugging support
-- Set global varibale to determine the OS
_G.IS_LINUX = vim.loop.os_uname().sysname == "Linux"
_G.IS_WINDOWS = vim.loop.os_uname().sysname == "Windows_NT"

require('config.lazy')
local builtin = require('telescope.builtin') -- local telescope-function-variable
require 'nvim-treesitter.install'.prefer_git = false
require('lazy').setup({ { 'nvim-treesitter/nvim-treesitter', build = 'TSUpdate' } })

-- disable netrw - WE USE OIL
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--faster updates for everything
vim.o.updatetime = 250

--better color, better life
vim.opt.termguicolors = true

--activate linenumbers
vim.opt.nu = true

vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8

--disable linewrap
vim.opt.wrap = false

--tab should be 4 spaces and no more!
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
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

--<SPACE>fe opens the Explorer
vim.keymap.set('n', '<leader>fe', ':Oil<CR>')

--<SPACE>ü opens the vimrc file for editing
vim.keymap.set('n', '<leader>o', ':e $MYVIMRC<CR>', { noremap = true, silent = true })

--Tabmaps
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-T>', ':tabclose<CR>', {noremap = true, silent = true}) taken out :q to be used

--telescope maps (this thing needs ripgrep, which can be installed which chocolatey)
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
--current directory grep-search
vim.keymap.set('n', '<leader>fs', function() builtin.grep_string({ search = vim.fn.input('Grep > ') }); end)

--undotree map(this thing needs diff, which comes with git-windwos, but needs to be in the PATH)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle Undotree' })

--Custom commands
vim.api.nvim_create_user_command("TabWidth2", function()
    vim.opt.tabstop = 2    -- Number of spaces a <Tab> in the file counts for
    vim.opt.shiftwidth = 2 -- Number of spaces for each step of (auto)indent
    vim.opt.expandtab = true -- Use spaces instead of tabs
    print("Tab width set to 2")
end, {})
