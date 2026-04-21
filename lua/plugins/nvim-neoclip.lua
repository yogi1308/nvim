return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		-- you'll need at least one of these
		-- {'nvim-telescope/telescope.nvim'},
		-- {'ibhagwan/fzf-lua'},
	},
	config = function()
		require("neoclip").setup()
	end,
	vim.keymap.set({ "n", "v" }, "<leader>fr", ":Telescope neoclip<CR>", { desc = "Open Clipboard Manager" }),
}
