if not Functionalities.cpp and not Functionalities.rust then
  return {}
end

return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  keys = {
    { "<leader>nd", function() require("neogen").generate() end,                   desc = "Neogen: Generate Doc (Contextual)" },
    { "<leader>nf", function() require("neogen").generate({ type = "func" }) end,  desc = "Neogen: Generate Function Doc" },
    { "<leader>nc", function() require("neogen").generate({ type = "class" }) end, desc = "Neogen: Generate Class Doc" },
    { "<leader>nt", function() require("neogen").generate({ type = "type" }) end,  desc = "Neogen: Generate Type/Struct Doc" },
    { "<leader>nF", function() require("neogen").generate({ type = "file" }) end,  desc = "Neogen: Generate File Doc" },
  },
  config = function()
    require("neogen").setup({
      -- native nvim snippet_engine used by blink
      snippet_engine = "nvim",

      languages = {
        c = {
          template = { annotation_convention = "doxygen" }
        },
        cpp = {
          template = { annotation_convention = "doxygen" }
        },
        rust = {
          template = { annotation_convention = "rustdoc" }
        }
      }
    })
  end,
}
