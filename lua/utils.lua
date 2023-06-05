local M = {}

function map(mode, shortcut, command, opts)
  opts = opts or {}
  opts.silent = true
  -- convenience function `vim.keymap.set` sets noremap by default
  vim.keymap.set(mode, shortcut, command, opts)
end

function M.nmap(shortcut, command, opts)
  map("n", shortcut, command, opts)
end

function M.imap(shortcut, command, opts)
  map("i", shortcut, command, opts)
end

function M.vmap(shortcut, command, opts)
  map("v", shortcut, command, opts)
end

function M.xmap(shortcut, command, opts)
  map("x", shortcut, command, opts)
end

return M
