return {
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",

		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			local listeners = dap.listeners
			listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Keymaps
			require("which-key").add({
				{ "<leader>d", group = "Debugger" },

				{ "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle [B]reakpoint" },
				{ "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "[C]ontinue" },
				{ "<leader>dn", "<cmd>lua require'dap'.step_over()<CR>", desc = "[N]ext Operation" },
				{ "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step [i]nside operation" },
				{ "<leader>do", "<cmd>lua require'dap'.step_out()<CR>", desc = "Step [o]utside operation" },
				{ "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", desc = "Toggle [U]I" },
			})
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },

		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
