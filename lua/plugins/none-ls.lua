return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				--lua
				null_ls.builtins.formatting.stylua,

				--ruby
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.diagnostics.rubocop,

				--js/ts
				null_ls.builtins.formatting.prettier,

				-- cpp
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4}" },
				}),

				-- python
				null_ls.builtins.formatting.ruff,
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
