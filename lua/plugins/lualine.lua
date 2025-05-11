local M = {}

local word_count = function()
  return vim.fn.wordcount().words .. ' words'
end

local markdown_only = function()
  return vim.bo.filetype == 'markdown'
end

M.setup = function()
  require("lualine").setup {
    options = {
      theme = "onedark",
      globalstatus = true,
    },
    sections = {
      lualine_y = {
        { word_count, cond = markdown_only },
        'progress'
      },
    },
  }
end

return M
