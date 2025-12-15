-- <Esc> clears search highlights in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics [q]uickfix list" })

-- Exit terminal mode with <Esc><Esc>, because the default binds make no sense
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- DISCIPLINE
vim.keymap.set("n", "<left>", "<cmd>echo 'Use [h]jkl to move!'<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo 'Use h[j]kl to move!'<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo 'Use hj[k]l to move!'<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo 'Use hjk[l] to move!'<CR>")

-- Navigate between splits
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

-- Move the splits
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move focus to the right window" })
