return {
	{
		"nvim-treesitter/nvim-treesitter",

		build = ":TSUpdate",
		main = "nvim-treesitter.configs",

		opts = {
			ensure_installed = {},
			auto_install = true,

			highlight = { enable = true },
			indent = { enable = true },
		},
	},
}
