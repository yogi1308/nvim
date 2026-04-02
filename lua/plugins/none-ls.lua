return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				--lua
				null_ls.builtins.formatting.stylua,

				--ruby
				-- null_ls.builtins.formatting.rubocop,
				-- null_ls.builtins.diagnostics.rubocop,

				--js/ts
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint,

				--python
				null_ls.builtins.formatting.ruff,
				null_ls.builtins.diagnostics.ruff,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
