-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If lazy.nvim isn't installed, clone the repo
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})

		vim.fn.getchar()
		os.exit(1)
	end
end

-- Add lazy.nvim to the runtime path
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("options")
require("keymaps")

-- Highlight text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,

	desc = "Highlight when yanking (copying) text",
})

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Import the plugins here.
		"NMAC427/guess-indent.nvim",

		-- If you need configuration, please create separate specs
		-- files in the lua/plugins/ direcrory.
		-- We do this to avoid having a single large init.lua,
		-- and it is also easier to search through.
		{ import = "plugins" },
	},

	install = {
		colorscheme = { "catppuccin" }, -- Colorscheme used in the install screen
	},
	checker = { enabled = true }, -- Automatically check for plugin updates
})
