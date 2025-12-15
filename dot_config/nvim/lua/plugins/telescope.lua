return {
	"nvim-telescope/telescope.nvim",

	event = "VimEnter",

	dependencies = {
		"nvim-lua/plenary.nvim",

		"nvim-telescope/telescope-ui-select.nvim",

		{
			"nvim-telescope/telescope-fzf-native.nvim",

			build = "make",

			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},

		{ "nvim-tree/nvim-web-devicons", enable = vim.g.have_nerd_font },
	},

	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				mappings = {},
			},
			pickers = {},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- If installed, load extensions
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		require("which-key").add({
			{ "<leader>s", group = "Search" },

			{ "<leader>sh", builtin.help_tags, desc = "[S]earch [H]elp" },
			{ "<leader>sk", builtin.keymaps, desc = "[S]earch [K]eymaps" },
			{ "<leader>sf", builtin.find_files, desc = "[S]earch [F]iles" },
			{ "<leader>ss", builtin.builtin, desc = "[S]earch [S]elect Telescope" },
			{ "<leader>sw", builtin.grep_string, desc = "[S]earch current [W]ord" },
			{ "<leader>sg", builtin.live_grep, desc = "[S]earch by [G]rep" },
			{ "<leader>sd", builtin.diagnostics, desc = "[S]earch [D]iagnostics" },
			{ "<leader>sr", builtin.resume, desc = "[S]earch [R]esume" },
			{ "<leader>sg", builtin.live_grep, desc = "[S]earch by [G]rep" },
			{ "<leader>s.", builtin.oldfiles, desc = '[S]earch Recent Files ("." for repeat)' },
			{ "<leader>sd", builtin.diagnostics, desc = "[S]earch [D]iagnostics" },
			{ "<leader><leader>", builtin.buffers, desc = "[ ] Find existing buffers" },
		})
	end,
}
