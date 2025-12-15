-- Set <leader> to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nerd font (icons)
vim.g.have_nerd_font = true

-- Line numbers
vim.o.number = true

-- This looks weird
--vim.o.relativenumber = true

-- Indentation
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.smarttab = true

-- Enable mouse mode
vim.o.mouse = "a"

-- This is going to be shown in the statusline
vim.o.showmode = false

-- Schedule after `UiEnter` because it can increase startup time.
vim.schedule(function()
	vim.o.clipboard = "unnamedplus" -- Sync clipboard with the OS (wl-clipboard)
end)

-- Limit line length to 70 characters
vim.o.textwidth = 70
vim.o.breakindent = true -- Maintain indentation for wrapped lines

-- Save undo history
vim.o.undofile = true

-- Column to show signs like warnings from the LSP, or breakpoints for DAP
vim.o.signcolumn = "yes:2"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- How splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Whitespace
vim.o.list = true
vim.opt.listchars = {
	tab = "» ", -- Indentation
	trail = "·", -- Trailing spaces
	nbsp = "␣", -- Non-breakable space character (\u202f)
}

-- Preview substitutions as you type
vim.o.inccommand = "split"

-- Highlight the line at which the cursor is at
vim.o.cursorline = true

-- Minimum amount of lines to keep above/below the cursor
vim.o.scrolloff = 4

-- If performing an action will fail due to unsaved changes in
-- the buffer (e.g. `:q`), instead raises a dialog, asking whether
-- you would like to save.
vim.o.confirm = true

-- Highlight text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,

	desc = "Highlight when yanking (copying) text",
})
