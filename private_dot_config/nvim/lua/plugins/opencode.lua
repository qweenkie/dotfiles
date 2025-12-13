return {
	"NickvanDyke/opencode.nvim",

	dependencies = {
		---@module "snacks"
		{
			"folke/snacks.nvim",
			opts = {
				input = {},
				picker = {},
				terminal = {},
			},
		},
	},

	config = function()
		vim.o.autoread = true

		require("which-key").add({
			{ "<leader>o", group = "[O]penCode" },
			{
				"<leader>ot",
				function()
					require("opencode").toggle()
				end,
				desc = "[T]oggle OpenCode",
			},
			{
				"<leader>oa",
				function()
					require("opencode").ask("@this: ", { submit = true })
				end,
				desc = "[A]sk OpenCode",
			},
			{
				"<leader>ox",
				function()
					require("opencode").select()
				end,
				desc = "E[x]ecute OpenCode action...",
			},
			{
				"<leader>o",
			},
		})
	end,
}
