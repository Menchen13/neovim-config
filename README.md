Done with version v0.11.0-dev of neovim

Telescope needs ripgrep(rg.exe), which can easily be installed using chocolatey.
Git for Windows is also an obvious dependency and its tools(specifically diff) should be in the PATH.

all of this needs to go into AppData\Local\nvim


Installed Plugins:
+ saghen/blink.cmp(uses a few thing under the hood ¯\_(ツ)_/¯)
+ folke/tokyonight.nvim
+ numToStr/Comment.nvim
+ tpope/vim-fugitive
+ folke/lazydev.nvim
+ nvim-telescope/telescope.nvim
+ nvim-treesitter/nvim-treesitter
+ mbbill/undotree
+ williamboman/mason.nvim
+ neovim/nvim-lspconfig(the C/C++ lsp is clangd and it need to be be pointed to the g++ executable in the lsp.lua file)
+ williamboman/mason-lspconfig.nvim (list of available language-servers can be found here)
+ Civitasv/cmake-tools.nvim (Path to kit needs to be adjusted)
+ akinsho/toggleterm.nvim
+ nvim-lualine/lualine.nvim (For icons: "nerd-fonts-Hack" can be installed with choco and needs to be configured in terminal settings)
+ stevearc/oil.nvim
