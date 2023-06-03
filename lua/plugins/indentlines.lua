local M = {}

M.setup = function()
  require("indent_blankline").setup({
    filetype_exclude = {
      "help",
      "man",
      "lspinfo",
      "checkhealth",
      "lazy",
      "NvimTree",
    },
    char = icons.ui.LineLeft,
    context_char = icons.ui.BoldLineLeft,
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    use_treesitter_scope = true,
    show_current_context = true,
  })
end

return M
