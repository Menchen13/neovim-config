Done with version v0.11.0-dev of neovim

all of this needs to go into AppData\Local\nvim or ~/.config/nvim/

This should work out of on both windows and Linux with the correct configs being loaded based on the OS.

Some Differences:
+ On Windows the compile-commands cant be symlinked without admin rights, which changes some things for lsp.lua and cmake-tools.lua
+ There wont be any kit for linux so the path is taken out in cmake-tools.lua

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
+ neovim/nvim-lspconfig(the C/C++ lsp is clangd and, on windows, it need to be be pointed to the g++ executable in the lsp.lua file)
+ williamboman/mason-lspconfig.nvim (list of available language-servers can be found here)
+ Civitasv/cmake-tools.nvim (Path to kit needs to be adjusted)
+ akinsho/toggleterm.nvim
+ nvim-lualine/lualine.nvim (For icons: "nerd-fonts-Hack" can be installed with choco and needs to be configured in terminal settings)
+ stevearc/oil.nvim

Dependencys:
+ Telescope needs ripgrep(rg.exe), which can easily be installed using chocolatey.
+ Git for Windows is also an obvious dependency and its tools(specifically diff) should be in the PATH.
+ nerd-font
+ python3 with venv module for pylsp
+ Perl for vimtex (on windows prolly strawbeery perl)

Modular-Functionality:
By editing the functionalities.lua file the config dynamicly install plugins/LSPs to provide the selected ones.
This way the Config can be as minimalistic and lightweight as possible
