-- Clear search highlights with <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode with <Esc><Esc>, because the default binds make no sense
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Navigate between splits
vim.keymap.set("n", "<C-left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })

vim.keymap.set("n", "<C-down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })

vim.keymap.set("n", "<C-up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

-- Move the splits
vim.keymap.set("n", "<C-S-left>", "<C-w>H", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move focus to the left window" })

vim.keymap.set("n", "<C-S-down>", "<C-w>J", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move focus to the lower window" })

vim.keymap.set("n", "<C-S-up>", "<C-w>K", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-S-right>", "<C-w>L", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move focus to the right window" })
