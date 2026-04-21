return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Telescope Find keymaps" })
		vim.keymap.set("n", "<leader>fa", function()
			builtin.find_files({ hidden = true, no_ignore = true })
		end, { desc = "Telescope find all files (hidden)" })

		-- 2. Live Grep (including hidden)
		-- We use 'additional_args' to pass the flag to the underlying 'ripgrep' command
		vim.keymap.set("n", "<leader>fG", function()
			builtin.live_grep({
				additional_args = function(args)
					return { "--hidden", "--no-ignore" }
				end,
			})
		end, { desc = "Telescope live grep (including hidden)" })
	end,
}
