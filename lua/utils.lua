local M = {}

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function M.nmap(shortcut, command)
  map('n', shortcut, command)
end

function M.imap(shortcut, command)
  map('i', shortcut, command)
end

function M.vmap(shortcut, command)
  map('v', shortcut, command)
end

return M
