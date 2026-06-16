return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	opts = {
		window = {
			position = "left",
			width = 10,
		},
	},
	lazy = false, -- neo-tree will lazily load itself
	config = function()
		vim.keymap.set("n", "<leader>nn", function()
			vim.cmd("Neotree filesystem toggle left")
			vim.cmd("vertical resize 30")
		end, { desc = "Opens Filesystem using Neo-tree to the left" })
	end,
}
