return {
	{ "ThePrimeagen/vim-be-good" },
	{ "folke/lazydev.nvim", ft = "lua", opts = {} },
	{ "tpope/vim-surround" },
	{
		"nvim-mini/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{ "windwp/nvim-ts-autotag", opts = {} },
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({
				windowCreationCommand = "topleft vsplit | vertical resize 50", -- open as left sidebar, 50 cols wide
			})

			-- open grug-far sidebar
			vim.keymap.set("n", "<leader>sr", "<cmd>GrugFar<cr>")

			-- open grug-far sidebar with word under cursor pre-filled in search
			vim.keymap.set("n", "<leader>sw", function()
				require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
			end)
		end,
	},
    { "mg979/vim-visual-multi" }
}
