local M = {}

local utils = require("utils")

M.setup = function()
  require("mini.surround").setup({
    silent = true,
    mappings = {
      add = "ys", -- Add surrounding in Normal and Visual modes
      delete = "ds", -- Delete surrounding
      replace = "cs", -- Replace surrounding
      find = "", -- Find surrounding (to the right)
      find_left = "", -- Find surrounding (to the left)
      highlight = "", -- Highlight surrounding
      update_n_lines = "", -- Update `n_lines`
      suffix_last = "", -- Suffix to search with "prev" method
      suffix_next = "", -- Suffix to search with "next" method
    },
  })
  -- Remap adding surrounding to Visual mode selection
  vim.keymap.del("x", "ys")
  utils.xmap("S", [[:<C-u>lua MiniSurround.add("visual")<CR>]])

  -- Make special mapping for "add surrounding for line"
  utils.nmap("yss", "ys_", { remap = true })
end

return M
