local M = {}

local icons = require("icons")

M.setup = function()
  require("ibl").setup({
    exclude = {
      filetypes = {
        "help",
        "man",
        "lspinfo",
        "checkhealth",
        "lazy",
        "NvimTree",
      },
    },
    indent = {
      char = icons.ui.LineLeft,
    },
    scope = {
      show_start = false,
      show_end = false,
      char = icons.ui.BoldLineLeft,
    },
  })
end

return M
