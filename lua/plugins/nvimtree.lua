local M = {}

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- apply default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- apply custom mappings
  vim.keymap.set('n', 'o', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'O', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.del('n', '<BS>', { buffer = bufnr })
  vim.keymap.set('n', '-', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'h', '5zh', opts('Move screen to left'))
  vim.keymap.set('n', 'l', '5zl', opts('Move screen to right'))
end


function M.setup()
  require('nvim-tree').setup(
    {
      on_attach = on_attach,
      auto_reload_on_write = false,
      sync_root_with_cwd = true,
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      renderer = {
        highlight_git = true,
        full_name = false,
        root_folder_label = ":t",
        icons = {
          glyphs = {
            default = icons.ui.Text,
            symlink = icons.ui.FileSymlink,
            bookmark = icons.ui.BookMark,
            folder = {
              arrow_closed = icons.ui.TriangleShortArrowRight,
              arrow_open = icons.ui.TriangleShortArrowDown,
              default = icons.ui.Folder,
              open = icons.ui.FolderOpen,
              empty = icons.ui.EmptyFolder,
              empty_open = icons.ui.EmptyFolderOpen,
              symlink = icons.ui.FolderSymlink,
              symlink_open = icons.ui.FolderOpen,
            },
            git = {
              unstaged = icons.git.FileUnstaged,
              staged = icons.git.FileStaged,
              unmerged = icons.git.FileUnmerged,
              renamed = icons.git.FileRenamed,
              untracked = icons.git.FileUntracked,
              deleted = icons.git.FileDeleted,
              ignored = icons.git.FileIgnored,
            },
          },
        },
      },
    }
  )
end

return M
