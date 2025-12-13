return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"startup-nvim/startup.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			require("startup").setup({ theme = "dashboard" })
		end,
	},
	{
		"nvim-mini/mini.nvim",

		config = function()
			require("mini.ai").setup({ n_lines = 1000 })
			require("mini.basics").setup()
			require("mini.icons").setup()
			require("mini.surround").setup()

			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			statusline.section_location = function()
				return "%21:%-2v" -- Set the section for cursor location to LINE:COLUMN
			end
		end,
	},
	{
		"lewis6991/gitsigns.nvim",

		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"Bekaboo/dropbar.nvim",

		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},

		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
		end,
	},

	{ "folke/todo-comments.nvim", event = "VimEnter", dependencies = { "nvim-lua/plenary.nvim" } },
}
