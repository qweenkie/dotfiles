return {
	{
		"nvim-treesitter/nvim-treesitter",

		build = ":TSUpdate",

		lazy = false,

		opts = {
			ensure_installed = {},
			auto_install = true,

			highlight = { enable = true },
			indent = { enable = true },
		},
	},
}
