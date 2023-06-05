local M = {}

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

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
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
      map("n", "<Leader>vs", gs.stage_hunk, { desc = "Stage hunk at position" })
      map("n", "<Leader>vu", gs.undo_stage_hunk, { desc = "Unstage hunk at position" })
      map("n", "<Leader>vr", gs.reset_hunk, { desc = "Reset hunk at position" })
      map("v", "<Leader>vs", function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, { desc = "Stage selection" })
      map("v", "<Leader>vr", function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, { desc = "Reset selection" })
      map("n", "<Leader>vS", gs.stage_buffer, { desc = "Git stage buffer" })
      map("n", "<Leader>vR", gs.reset_buffer, { desc = "Git reset buffer" })
      map("n", "<Leader>vp", gs.preview_hunk, { desc = "Preview hunk at position" })
      map("n", "<Leader>vb", function() gs.blame_line{full=true} end, { desc = "Git blame current line" })
    end,
  })
end

return M
