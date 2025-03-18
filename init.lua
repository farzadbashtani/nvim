-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- indent via 4 spaces instead of tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- disable animations
vim.g.snacks_animate = false

-- Save undo history
vim.opt.undofile = true

-- make search case-sensitive
vim.opt.ignorecase = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 12

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true
