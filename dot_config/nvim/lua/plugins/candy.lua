return {
	{
		"catppuccin/nvim",
		name = "cattpuccin",
		priority = 1000,

		-- config = function()
		-- 	vim.cmd.colorscheme("catppuccin-mocha")
		-- end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,

		config = function()
			vim.cmd.colorscheme("gruvbox")
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
				return "%21:%-2v"
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
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },

		event = "VimEnter",
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",

		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim", "nvim-tree/nvim-web-devicons" },

		opts = {
			completions = { lsp = { enabled = true } },
		},
	},
	{
		"mbbill/undotree",

		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "[U]ndo Tree" },
		},

		config = function()
			-- Open the tree on the right side
			vim.g.undotree_WindowLayout = 3
			vim.g.undotree_SplitWidth = 60

			-- Automatically show the tree when toggled
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
	{
		"folke/which-key.nvim",

		event = "VimEnter",

		opts = {
			delay = 0,

			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,

				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
				},

				-- Document existing key chaings
				spec = {
					{ "<leader>s", group = "<S>earch" },
					{ "<leader>t", group = "<T>oggle" },
					{ "<leader>h", group = "Git <H>unk", mode = { "n", "v" } },
				},
			},
		},
	},
}
