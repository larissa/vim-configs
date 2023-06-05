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
  {
    "scrooloose/nerdcommenter",
    init = function()
      -- add space around comment delimiters on NERDCommenter
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDDefaultAlign = 'left'
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins/nvimtree").setup()
    end,
    init = function()
      -- toggle directory view
      utils.nmap("<Leader>t", ":NvimTreeToggle<CR>")
      -- reveal current file in directory tree
      utils.nmap("<Leader>r", ":NvimTreeFindFile<CR>")
    end,
  },
  {
    "jremmen/vim-ripgrep",
    init = function()
      -- map ripgrep search to <leader>s[search]
      utils.nmap("<Leader>s", ":Rg<CR>")
      utils.vmap("<Leader>s", ":call RgVisual()<CR>")
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

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins/gitsigns").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    init = function()
      utils.nmap("<Leader>vg", ":Ge:<CR>")
    end
  },

  {
    "majutsushi/tagbar",
    init = function()
      -- toggle g[o] to navigation
      utils.nmap("<Leader>g", ":TagbarToggle<CR>")
      vim.g.tagbar_autoclose = 1
      vim.g.tagbar_autofocus = 1
      vim.g.tagbar_map_help = "<F1>"
    end,
  },
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
    config = function()
      require("bufferline").setup {}
    end,
  },
  {
    "j-morano/buffer_manager.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("buffer_manager").setup {}
    end,
    init = function()
      local bmui = require("buffer_manager.ui")
      -- key mapping to l[ist] buffers to be managed (e.g bulk close)
      utils.nmap("<Leader>l", bmui.toggle_quick_menu)
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
      require('mini.bufremove').setup {}
    end,
    init = function()
      local bufremove = require("mini.bufremove")
      -- key mapping to delete buffer while preserving windows
      utils.nmap("<Leader>d", bufremove.wipeout)
    end
  },
  {
    "junegunn/vim-easy-align",
    init = function()
      -- start interactive EasyAlign in visual mode (e.g. vip<Enter>)
      utils.vmap("<Enter>", "<Plug>(EasyAlign)")
      -- start interactive EasyAlign for a motion/text object (e.g. gaip)
      utils.nmap("ga", "<Plug>(EasyAlign)")
    end,
  },
  "Lokaltog/vim-easymotion",
  {
    "unblevable/quick-scope",
    -- Trigger a highlight in the appropriate direction when pressing these keys
    init = function()
      vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
    end,
  },
  "jamessan/vim-gnupg",
  { "neoclide/coc.nvim", branch = "release" },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins/indentlines").setup()
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  {
    "junegunn/fzf", build = "./install --bin",
    dependencies = "junegunn/fzf.vim",
  },
  "dag/vim-fish",
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
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup {
        style = 'warm',
        toggle_style_key = '<F9>',
      }
    end,
    init = function()
      require('onedark').load()
    end,
  },
})
