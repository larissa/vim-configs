local M = {}

local utils = require("utils")

-- code from <https://github.com/tjdevries/lazy-require.nvim/blob/bb626818ebc175b8c595846925fd96902b1ce02b/lua/lazy-require.lua#L25>
local require_on_exported_call = function(require_path)
  return setmetatable({}, {
    __index = function(_, k)
      return function(...)
        return require(require_path)[k](...)
      end
    end,
  })
end

M.setup = function()
  local telescope = require("telescope")
  local actions = require_on_exported_call("telescope.actions")
  telescope.setup({
    defaults = {
      initial_mode = "insert",
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      ---@usage Mappings are fully customizable. Many familiar mapping patterns are setup as defaults.
      mappings = {
        i = {
          ["<C-d>"] = actions.results_scrolling_down,
          ["<C-u>"] = actions.results_scrolling_up,
          ["<C-f>"] = actions.preview_scrolling_down,
          ["<C-b>"] = actions.preview_scrolling_up,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-c>"] = actions.close,
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<C-q>"] = function(...)
            actions.smart_send_to_qflist(...)
            actions.open_qflist(...)
          end,
          ["<CR>"] = actions.select_default,
        },
        n = {
          ["<C-d>"] = actions.results_scrolling_down,
          ["<C-u>"] = actions.results_scrolling_up,
          ["<C-f>"] = actions.preview_scrolling_down,
          ["<C-b>"] = actions.preview_scrolling_up,
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-q>"] = function(...)
            actions.smart_send_to_qflist(...)
            actions.open_qflist(...)
          end,
        },
      },
      path_display = { "truncate" },
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    },
    pickers = {
      find_files = {
        theme = "ivy",
        hidden = true,
      },
      live_grep = {
        theme = "ivy",
        --@usage don't include the filename in the search results
        only_sort_text = true,
      },
      grep_string = {
        theme = "ivy",
        only_sort_text = true,
        path_display = { "shorten" },
      },
      buffers = {
        theme = "ivy",
        initial_mode = "normal",
        mappings = {
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },
      git_commits = {
        mappings = {
          i = {
            ["<Tab>"] = actions.cycle_previewers_next,
            ["<S-Tab>"] = actions.cycle_previewers_prev,
          },
          n = {
            ["<Tab>"] = actions.cycle_previewers_next,
            ["<S-Tab>"] = actions.cycle_previewers_prev,
          },
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      live_grep_args = {
        theme = "ivy",
        auto_quoting = false,
      },
    },
  })
  pcall(function()
    telescope.load_extension "fzf"
  end)

  utils.nmap("<Leader>f", "<CMD>Telescope find_files<CR>", { desc = "Find files" })
  utils.nmap("<Leader>b", "<CMD>Telescope buffers<CR>", { desc = "Find buffers" })
  utils.nmap("<Leader>h", "<CMD>Telescope live_grep<CR>", { desc = "Find text" })
  utils.nmap("<Leader>s", "<CMD>Telescope grep_string<CR>", { desc = "Find word under cursor" })
  utils.vmap("<Leader>s", "<CMD>Telescope grep_string<CR>", { desc = "Find word under cursor" })
  utils.nmap("<Leader>vc", "<CMD>Telescope git_commits<CR>", { desc = "Find commit message" })

  vim.api.nvim_create_user_command("Rg", function()
    require('telescope').extensions.live_grep_args.live_grep_args()
  end, { desc = "Grep for a string with custom arguments" })
end

return M
