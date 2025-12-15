return {
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",

			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},

		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

				callback = function(event)
					local builtin = require("telescope.builtin")

					require("which-key").add({
						{ "grn", vim.lsp.buf.rename, desc = "LSP: [R]e[n]ame", buffer = event.buf },
						{
							"gra",
							vim.lsp.buf.code_action,
							desc = "LSP: Goto Code [A]ction",
							buffer = event.buf,
							mode = { "n", "x" },
						},
						{ "grr", builtin.lsp_references, desc = "LSP: [G]oto [R]eferences", buffer = event.buf },
						{
							"gri",
							builtin.lsp_implementations,
							desc = "LSP: [G]oto [I]mplementation",
							buffer = event.buf,
						},
						{ "grd", builtin.lsp_definitions, desc = "LSP: [G]oto [D]efinition", buffer = event.buf },
						{
							"grt",
							builtin.lsp_type_definitions,
							desc = "LSP: [G]oto [T]ype Definition",
							buffer = event.buf,
						},
						{ "grD", vim.lsp.buf.declaration, desc = "LSP: [G]oto [D]eclaration", buffer = event.buf },
						{
							"gO",
							builtin.lsp_document_symbols,
							desc = "LSP: Search d[o]cument symbols",
							buffer = event.buf,
						},
						{
							"gW",
							builtin.lsp_workspace_symbols,
							desc = "LSP: Search [w]orkspace symbols",
							buffer = event.buf,
						},
					})

					-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.

					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
							end,
						})
					end
				end,
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			-- By default, Neovim doesn't support everything that is in the LSP specification.
			-- When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.

			--  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			require("mason-lspconfig").setup({
				ensure_installed = {}, -- Explicitly set to {}, since this will be populated by mason-tool-installer
				automatic_installation = false,

				handlers = {
					function(server_name)
						local server = {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities)

						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	-- `lazydev.nvim` configures the Lua LSP for the nvim config, runtime, and plugins.
	-- It is used for completion, annotations, and signatures of neovim APIs.
	{
		"folke/lazydev.nvim",
		ft = "lua",

		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- `rustaceanvim` is a preconfigured fork of rust-tools.nvim
	{
		"mrcjkb/rustaceanvim",
		lazy = false, -- This plugin is already lazy
	},
}
