-- ===============================================================
-- =====                     PLUGINS                         =====
-- ===============================================================

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
    "jiangmiao/auto-pairs",
    init = function()
      -- remove auto-pairs mapping for meta key
      vim.g.AutoPairsShortcutBackInsert = ''
      vim.g.AutoPairsShortcutToggle = ''
      vim.g.AutoPairsShortcutFastWrap = ''
      vim.g.AutoPairsShortcutJump = ''
    end,
  },
  "tpope/vim-endwise",
  "tpope/vim-fugitive",
  "honza/vim-snippets",
  "tpope/vim-surround",
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
    "SirVer/ultisnips",
    init = function()
      -- expand snippets with C-space by default so it doesn't override other mappings
      vim.g.UltiSnipsExpandTrigger="<c-space>"
    end,
  },
  "tpope/vim-unimpaired",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("lualine").setup {
        options = {
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
      require("bufferline").setup{}
    end,
  },
  {
    "jeetsukumaran/vim-buffergator",
    init = function()
      vim.g.buffergator_viewport_split_policy = "B"
      vim.g.buffergator_autoexpand_on_split = 0
      vim.g.buffergator_split_size = 5
      vim.g.buffergator_suppress_keymaps = 1
      -- key mapping to l[ist] buffers using buffergator
      utils.nmap("<Leader>l", ":BuffergatorToggle<CR>")
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
  "thaerkh/vim-indentguides",
  { "neoclide/coc.nvim", branch = "release" },
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
    },
  },
  "RRethy/nvim-base16",
})
