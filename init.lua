local utils = require("utils")

-- swap \ and ', use single quote as leader
-- leader needs to be mapped before any other mapping
vim.g.mapleader = "'"
utils.nmap("\\", "'")

-- vim needs a POSIX compatible shell
vim.opt.shell = "/bin/sh"

-- install plugins
require("plugins")

-- misc vim configuration
vim.cmd("source ~/.nvim/misc.vim")

-- plugins custom settings
vim.cmd("source ~/.nvim/settings.vim")

-- theme vim configuration
vim.cmd("source ~/.nvim/theme.vim")

-- custom mappings
vim.cmd("source ~/.nvim/mappings.vim")

require("treesitter")
