local M = {}

local utils = require("utils")
local icons = require("icons")

M.setup = function()
  require("gitsigns").setup({
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = icons.ui.BoldLineLeft,
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      change = {
        hl = "GitSignsChange",
        text = icons.ui.BoldLineLeft,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        hl = "GitSignsDelete",
        text = icons.ui.Triangle,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = icons.ui.Triangle,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = icons.ui.BoldLineLeft,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    status_formatter = nil, -- Use default
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function opts(desc)
        return { buffer = bufnr, desc = "Gitsigns: " .. desc }
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
      end, { expr=true })

      map("n", "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
      end, { expr=true })

      -- Actions
      utils.nmap("<Leader>vs", gs.stage_hunk, opts("Stage hunk at position"))
      utils.nmap("<Leader>vu", gs.undo_stage_hunk, opts("Unstage hunk at position"))
      utils.nmap("<Leader>vr", gs.reset_hunk, opts("Reset hunk at position"))
      utils.vmap("<Leader>vs", function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, opts("Stage selection"))
      utils.vmap("<Leader>vr", function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, opts("Reset selection"))
      utils.nmap("<Leader>vS", gs.stage_buffer, opts("Git stage buffer"))
      utils.nmap("<Leader>vR", gs.reset_buffer, opts("Git reset buffer"))
      utils.nmap("<Leader>vp", gs.preview_hunk, opts("Preview hunk at position"))
      utils.nmap("<Leader>vb", function() gs.blame_line{full=true} end, opts("Git blame current line"))
    end,
  })
end

return M
