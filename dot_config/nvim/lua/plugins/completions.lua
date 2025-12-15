return {
	-- Very small but smart algorithm that automatically detects
	-- the proper amount of indentation.
	"NMAC427/guess-indent.nvim",

	{
		"saghen/blink.cmp",

		dependencies = {
			-- Snippets
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",

				build = function()
					if vim.fn.executable("make") == 1 then
						return "make install_jsregexp"
					end
				end,
				dependencies = {
					{
						"rafamadriz/friendly-snippets",

						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},

				opts = {},
			},

			"folke/lazydev.nvim",
		},

		version = '1.*',

		opts = {
			keymap = { preset = "super-tab" },
			appearance = { nerd_font_variant = "mono" },

			completion = {
				documentation = { auto_show = true },
			},

			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"lazydev",
				},

				providers = {
					lazydev = {
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},

				snippets = { preset = "luasnip" },

				fuzzy = { implementation = "prefer_rust_with_warning" },

				signature = { enabled = true },
			},
		},
	},

	-- Autopairs
	{
		"windwp/nvim-autopairs",

		event = "InsertEnter",

		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-autopairs").setup({ check_ts = true })
		end,
	},
}
