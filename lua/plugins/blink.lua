return {
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        
        opts = {
            keymap = { preset = 'enter' },

            appearance = {
                use_nvim_cmp_as_default = true,
            },

            completion = {
                -- 1. Trust the LSP for brackets (Fixes "Replace" mode in Rust)
                accept = { 
                    auto_brackets = { enabled = false },
                },

                -- 2. Automatically show documentation (Works great for Rust)
                -- If C++ doesn't send docs, this window just won't appear.
                documentation = { 
                    auto_show = true, 
                    auto_show_delay_ms = 500 
                },
            },

            sources = {
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
}
