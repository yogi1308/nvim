return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"pyright",
					"eslint",
					"emmet_language_server",
					"tailwindcss",
					"clangd",
					"ruby_lsp",
					"rubocop",
					"ruff",
					"cssls",
					"prismals",
					"hyprls",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							diagnosticMode = "off",
						},
					},
				},
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
				end,
			})
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("ruff")
			vim.lsp.enable("eslint")
			vim.lsp.enable("emmet_language_server")
			vim.lsp.enable("tailwindcss")
			vim.lsp.enable("clangd")
			vim.lsp.enable("ruby_lsp")
			vim.lsp.enable("rubocop")
			vim.lsp.enable("ruff")
			vim.lsp.enable("cssls")
			vim.lsp.enable("prismals")
			vim.lsp.enable("hyprls")
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
