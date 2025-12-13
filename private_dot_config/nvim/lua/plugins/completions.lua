return {
	{
		"saghen/blink.cmp",
		version = "1.*",

		event = "VimEnter",

		dependencies = {
			-- Snippet engine
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",

				build = (function()
					if vim.fn.executable("make") == 1 then
						return "make install_jsregexp"
					end
				end)(),

				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function(_)
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},

				opts = {},
			},

			"folke/lazydev.nvim",
		},

		opts = {
			keymap = {
				-- 'default' (recommended) for mappings similar to built-in completions
				--   <c-y> to accept ([y]es) the completion.
				--    This will auto-import if your LSP supports it.
				--    This will expand snippets if the LSP sent a snippet.
				-- 'super-tab' for tab to accept
				-- 'enter' for enter to accept
				-- 'none' for no mappings

				-- For an understanding of why the 'default' preset is recommended,
				-- you will need to read `:help ins-completion`

				-- No, but seriously. Please read `:help ins-completion`, it is really good!

				-- All presets have the following mappings:
				-- <tab>/<s-tab>: move to right/left of your snippet expansion
				-- <c-space>: Open menu or open docs if already open
				-- <c-n>/<c-p> or <up>/<down>: Select next/previous item
				-- <c-e>: Hide menu
				-- <c-k>: Toggle signature help
				--
				-- See :h blink-cmp-config-keymap for defining your own keymap
				preset = "super-tab",
			},

			appearance = { nerd_font_variant = "mono" },

			completion = {
				-- <C-Space> to show the documentation
				documentation = { auto_show = true, auto_show_delay_ms = 1000 },
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

	-- Autopairs (parentheses, brackets, etc.)
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",

		dependencies = { "nvim-treesitter/nvim-treesitter" },

		config = function()
			require("nvim-autopairs").setup({ check_ts = true }) -- Treesitter integrations
		end,
	},
}
