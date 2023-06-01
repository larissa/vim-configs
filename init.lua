utils = require("utils")
icons = require("icons")

-- swap \ and ', use single quote as leader
-- leader needs to be mapped before any other mapping
vim.g.mapleader = "'"
utils.nmap("\\", "'")

-- vim needs a POSIX compatible shell
vim.opt.shell = "/bin/sh"

-- netrw will be replaced by a plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- install plugins
require("plugins")

-- misc vim configuration
vim.cmd("source ~/.nvim/misc.vim")

-- plugins custom settings
vim.cmd("source ~/.nvim/settings.vim")

-- custom mappings
vim.cmd("source ~/.nvim/mappings.vim")

require("treesitter")
