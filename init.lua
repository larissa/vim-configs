local utils = require("utils")

-- swap \ and ', use single quote as leader
-- leader needs to be mapped before any other mapping
vim.g.mapleader = "'"
utils.nmap("\\", "'")

-- vim needs a POSIX compatible shell
vim.opt.shell = "/bin/zsh"

-- netrw will be replaced by a plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- install plugins
require("plugins")

-- misc vim configuration
vim.cmd("source ~/.nvim/misc.vim")

-- custom mappings
vim.cmd("source ~/.nvim/mappings.vim")
