return {
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
}
