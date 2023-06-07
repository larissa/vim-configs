local M = {}

local icons = require("icons")

local signs = {
  { name = "DiagnosticSignError", text = icons.diagnostics.Error },
  { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
  { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
  { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
}

M.setup = function()
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

-- Set autocommands conditional on server_capabilities
local function setup_document_highlight(client, bufnr)
  local status_ok, highlight_supported = pcall(function()
    return client.supports_method "textDocument/documentHighlight"
  end)
  if not status_ok or not highlight_supported then
    return
  end
  local group = "lsp_document_highlight"
  local hl_events = { "CursorHold", "CursorHoldI" }

  local ok, hl_autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = group,
    buffer = bufnr,
    event = hl_events,
  })

  if ok and #hl_autocmds > 0 then
    return
  end

  vim.api.nvim_create_augroup(group, { clear = false })
  vim.api.nvim_create_autocmd(hl_events, {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.buf.document_highlight,
  })
  vim.api.nvim_create_autocmd("CursorMoved", {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.buf.clear_references,
  })
end

local function setup_keymaps(bufnr)
  -- create local, buffer mapping
  local nmap = function(shortcut, command, description)
    vim.api.nvim_buf_set_keymap(bufnr, "n", shortcut, command, {
      noremap = true,
      silent = true,
      desc = description,
    })
  end
  local command = function(name, func)
    vim.api.nvim_buf_create_user_command(bufnr, name, func, { bang = true })
  end

  nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition")
  nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration")
  nmap("[d", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", "Go to previous diagnostic")
  nmap("]d", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", "Go to next diagnostic")

  nmap("<Leader>ge", "<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnostics")
  nmap("<Leader>gl", "<cmd>lua vim.diagnostic.setloclist()<CR>", "List all diagnostics")

  nmap("<Leader>gi", "<cmd>lua vim.lsp.buf.hover()<CR>", "Show method declaration")
  nmap("<Leader>gs", "<cmd>lua vim.lsp.buf.implementation()<CR>", "List all implementations")
  nmap("<Leader>gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show method signature help")
  nmap("<Leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", "Show all code references")

  -- Uncommon actions are set as commands
  command("CodeFormat", "execute 'lua vim.lsp.buf.format()'")
  command("CodeAction", "execute 'lua vim.lsp.buf.code_action()'")
  command("CodeRename", "execute 'lua vim.lsp.buf.rename()'")
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
  setup_keymaps(bufnr)
  setup_document_highlight(client, bufnr)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities()
end

return M
