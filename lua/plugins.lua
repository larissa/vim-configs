-- ===============================================================
-- =====                     PLUGINS                         =====
-- ===============================================================

local utils = require("utils")

-- lazy.nvim automatic installaion
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Editing / movements
  {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
      "RRethy/nvim-treesitter-endwise",
    },
    config = function()
      require("plugins/treesitter").setup()
    end
  },
  {
    "scrooloose/nerdcommenter",
    config = function()
      -- add space around comment delimiters on NERDCommenter
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDDefaultAlign = 'left'
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins/autopairs").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
      require("plugins/surround").setup()
    end
  },
  {
    "echasnovski/mini.bufremove",
    version = '*',
    config = function()
      bufremove = require("mini.bufremove")
      bufremove.setup {}
      -- key mapping to delete buffer while preserving windows
      utils.nmap("<Leader>d", bufremove.wipeout)
    end,
  },
  {
    "unblevable/quick-scope",
    -- Trigger a highlight in the appropriate direction when pressing these keys
    init = function()
      vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
    end,
  },
  {
    "junegunn/vim-easy-align",
    config = function()
      -- start interactive EasyAlign in visual mode (e.g. vip<Enter>)
      utils.vmap("<Enter>", "<Plug>(EasyAlign)")
      -- start interactive EasyAlign for a motion/text object (e.g. gaip)
      utils.nmap("ga", "<Plug>(EasyAlign)")
    end,
  },
  "Lokaltog/vim-easymotion",
  "jamessan/vim-gnupg",

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins/gitsigns").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      utils.nmap("<Leader>vg", ":Ge:<CR>")
    end
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins/cmp").setup()
    end,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require('luasnip').filetype_extend("ruby", {"rails"})
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
    version = "*",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "j-morano/buffer_manager.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("buffer_manager").setup {}
      local bmui = require("buffer_manager.ui")
      -- key mapping to l[ist] buffers to be managed (e.g bulk close)
      utils.nmap("<Leader>l", bmui.toggle_quick_menu)
    end,
  },

  -- Searching
  {
    "junegunn/fzf", build = "./install --bin",
    dependencies = "junegunn/fzf.vim",
  },
  {
    "jremmen/vim-ripgrep",
    config = function()
      -- map ripgrep search to <leader>s[search]
      utils.nmap("<Leader>s", ":Rg<CR>")
      utils.vmap("<Leader>s", ":call RgVisual()<CR>")
    end,
  },

  -- UI
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins/indentlines").setup()
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins/nvimtree").setup()
    end,
  },
  {
    "majutsushi/tagbar",
    config = function()
      -- toggle g[o] to navigation
      utils.nmap("<Leader>g", ":TagbarToggle<CR>")
      vim.g.tagbar_autoclose = 1
      vim.g.tagbar_autofocus = 1
      vim.g.tagbar_map_help = "<F1>"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("lualine").setup {
        options = {
          theme = "onedark",
          globalstatus = true,
        },
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = true,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      local onedark = require('onedark')
      onedark.setup {
        style = 'warm',
        toggle_style_key = '<F9>',
      }
      onedark.load()
    end,
  },

  -- LSP plugins
  {
    "w0rp/ale",
    init = function()
      -- customize linter signs
      vim.g.ale_sign_error = "●"
      vim.g.ale_sign_warning = "•"
      -- customize linter colours
      vim.cmd("highlight link ALEErrorSign DiffDelete")
      -- only lint when leaving insert mode after an edit
      vim.g.ale_lint_on_text_changed = "normal"
      vim.g.ale_lint_on_insert_leave = 1
      -- show error details with m[ore details]
      utils.nmap("<Leader>m", ":ALEDetail<CR>")
    end
  },
  { "neoclide/coc.nvim", branch = "release" },
})
