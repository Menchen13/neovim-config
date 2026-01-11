if not Functionalities.rust then
  return {}
end

return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false,   -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ['rust-analyzer'] = {
            completion = {
              -- 1. This is the big one: Auto-insert arguments (snippets)
              -- e.g., typing `func` -> `func(arg1, arg2)` with tab stops
              callSnippet = "Replace",

              -- 2. Show full documentation in the completion list
              postfix = { enable = true },

              -- 3. Cut down on noise if you prefer, or keep it explicitly "true"
              -- strict "clangd" style usually loves auto-imports
              autoimport = { enable = true },
            },
            -- Optional: Enable type hints while typing if you don't have them
            inlayHints = {
              lifetimeElisionHints = { enable = true, useParameterNames = true },
            },
            imports = {
              granularity = { group = "module" },
              prefix = "self",
            },
            cargo = {
              buildScripts = { enable = true },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
    }
  end
}
