if not Functionalities.latex then
  return {}
end

vim.g.maplocalleader = " " -- to match the generall leader
return {
  "lervag/vimtex",
  lazy = false,   -- we don't want to lazy load VimTeX
  init = function()
    -- Tell VimTeX to use a general viewer
    vim.g.vimtex_view_general_viewer = 'SumatraPDF'

    -- Pass options to SumatraPDF to reuse the same window
    -- and enable forward search syncing
    vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
  end
}
