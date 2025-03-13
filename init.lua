-- TODO: Debugging support
require('config.lazy')
local builtin = require('telescope.builtin') -- local telescope-function-variable
require 'nvim-treesitter.install'.prefer_git = false
require('lazy').setup({{'nvim-treesitter/nvim-treesitter', build = 'TSUpdate'}})

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
vim.opt.undodir = os.getenv('USERPROFILE') .. '/.nvim/undodir' -- this is Windows specific! os.getenv('HOME') for linux.
vim.opt.undofile = true
--remaps

--sets <SPACE> as mapleader(<leader>)
vim.g.mapleader = ' '

--<SPACE>fe opens the Explorer
vim.keymap.set('n', '<leader>fe', vim.cmd.Explore)

--<SPACE>ü opens the vimrc file for editing
vim.keymap.set('n', '<leader>ü', ':e $MYVIMRC<CR>', {noremap = true, silent = true})

--Tabmaps
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<C-T>', ':tabclose<CR>', {noremap = true, silent = true}) taken out :q to be used

--telescope maps (this thing needs ripgrep, which can be installed which chocolatey)
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
--current directory grep-search
vim.keymap.set('n', '<leader>fs', function() builtin.grep_string({ search = vim.fn.input('Grep > ') }); end)

--undotree map(this thing needs diff, which comes with git-windwos, but needs to be in the PATH)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {desc = 'Toggle Undotree'})

--format the entire file
vim.keymap.set('n', '<leader>p', 'm`gg=G``', {noremap = true, silent = true})

--opens GitStatus menu 
vim.keymap.set('n', '<leader>g', ':G<CR>', {noremap = true})

--remaps


