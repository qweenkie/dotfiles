-- Set leader key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable nerd font
vim.g.have_nerd_font = true

-- Line numbers
vim.o.number = true

-- Uncomment for relative line numbers.
-- Nice for jumping, but it looks weird imo.
--vim.o.relativenumber = true

-- Don't show the mode, since it is already in the status line
vim.o.showmode = false

-- This is scheduled after `UiEnter` because this might increase startup time
vim.schedule(function()
	vim.o.clipboard = "unnamedplus" -- Sync clipboard between the OS and neovim
end)

-- Break indent
vim.o.breakindent = true

-- Maximum 80 characters in a line
vim.o.textwidth = 80

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Signcolumn on, min width - 1, max width - 5
vim.o.signcolumn = "yes"

vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time

-- Configure how new splits are created
vim.o.splitright = true
vim.o.splitbelow = true

-- How nvim displays certain whitespace characters
-- See `:help listchars`
vim.o.list = true
vim.opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}

-- Preview substitutions as you type
vim.o.inccommand = "split"

-- Show the line where the cursor is at
vim.o.cursorline = true

-- Minimum amount of lines to keep above/below the cursor
vim.o.scrolloff = 8

-- When performing an operation that would fail due to unsaved data (like :q),
-- instead raise a dialog asking if you would like to save.
vim.o.confirm = true

-- Indentation
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.smartindent = true
vim.o.smarttab = true
