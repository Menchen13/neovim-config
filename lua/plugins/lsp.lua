return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },

    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'saghen/blink.cmp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        init = function()
            -- Reserve a space in the gutter
            -- This will avoid an annoying layout shift in the screen
            vim.opt.signcolumn = 'yes'
        end,
        config = function()
            --should be replaced with blink.cmp
            --[[ local lsp_defaults = require('lspconfig').util.default_config

        -- Add cmp_nvim_lsp capabilities settings to lspconfig
        -- This should be executed before you configure any language server
        lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
        ) ]]
            vim.diagnostic.config({
                virtual_text = true, -- Enable inline messages
                signs = true,        -- Show signs in the gutter (left column)
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = "rounded", -- Nice looking borders for floating windows
                },
            })
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            -- Define clangd command conditionally
            local cmd = {
                'clangd',
                '--background-index',
                '--clang-tidy',
                '--completion-style=detailed',
            }

            if IS_WINDOWS then
                table.insert(cmd, '--query-driver=C:/Users/Menchen/MinGW/bin/g++.exe')
                table.insert(cmd, '--query-driver=C:/Users/Menchen/MinGW/bin/gcc.exe')
            end


            -- LspAttach is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', 'grv', '<cmd>lua vim.lsp.buf.rename()<cr>', opts) -- rename variable
                    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

                    vim.keymap.set('n', '<leader>p', function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })

            -- Build the Mason ensure_installed list dynamically
            local ensure_installed = {}

            -- Always install lua_ls
            table.insert(ensure_installed, "lua_ls")

            -- C/C++ functionality
            if Functionalities.cpp then
                table.insert(ensure_installed, "clangd")
                table.insert(ensure_installed, "neocmake")
            end

            -- Python functionality
            if Functionalities.python then
                table.insert(ensure_installed, "pylsp")
            end


            require('mason-lspconfig').setup({
                automatic_enable = true,
                automatic_installation = false,
                ensure_installed = ensure_installed,
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        vim.lsp.config(server_name, { capabilities = capabilities })
                    end,
                    -- override specific servers
                    -- not sure why but the above format was fucking up the clangd lsp, so i am not using it for these
                    vim.lsp.config('lua_ls', { capabilities = capabilities }),   -- default for lua_ls
                    vim.lsp.config('neocmake', { capabilities = capabilities }), --default for neocmake
                    vim.lsp.config('pylsp', { capabilities = capabilities }),    --default for pylsp
                    vim.lsp.config('clangd', {
                        capabilities = capabilities,
                        cmd = cmd
                    }),
                }
            })
        end
    }
}
