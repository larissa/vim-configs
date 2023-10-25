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
      require("plugins.treesitter").setup()
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
      require("plugins.autopairs").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
      require("plugins.surround").setup()
    end
  },
  {
    "echasnovski/mini.bufremove",
    version = '*',
    config = function()
      local bufremove = require("mini.bufremove")
      bufremove.setup {}
      -- delete buffer while preserving windows
      utils.nmap("<Leader>d", bufremove.wipeout)
      -- force delete buffer even if there are unsaved changes
      utils.nmap("<Leader>D", function() bufremove.wipeout(0, true) end)
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
      require("plugins.gitsigns").setup()
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
      require("plugins.cmp").setup()
    end,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
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
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    config = function()
      require('plugins.telescope').setup()
    end,
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- UI
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indentlines").setup()
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.nvimtree").setup()
    end,
  },
  {
    "majutsushi/tagbar",
    config = function()
      -- toggle g[o] to navigation
      utils.nmap("<Leader>n", ":TagbarToggle<CR>")
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
        diagnostics = {
          darker = true, -- darker colors for diagnostic
          undercurl = true,   -- use undercurl instead of underline for diagnostics
          background = true,
        },
        highlights = {
          QuickScopePrimary = { fg = '$blue', bg = '$bg1' },
          QuickScopeSecondary = { fg = '$purple', bg = '$bg1' },
          IblScope = { fg = '$grey', fmt = "nocombine" },
        }
      }
      onedark.load()
    end,
  },

  -- LSP plugins
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("plugins.lsp")
    end,
  },
  { "jose-elias-alvarez/null-ls.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
  },
  {
    "williamboman/mason.nvim",
    build = function()
      pcall(function()
        require("mason-registry").refresh()
      end)
    end,
  },
})
