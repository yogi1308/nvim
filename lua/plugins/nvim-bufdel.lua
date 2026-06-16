return {
	"ojroques/nvim-bufdel",
	opts = {
		next = "tabs",
		quit = true,
	},
	keys = {
		{
			"<leader>x",
			function()
				local wins = vim.fn.win_findbuf(vim.api.nvim_get_current_buf())
				local total_wins = #vim.api.nvim_list_wins()
				-- count only normal windows (excludes neo-tree, floats etc)
				local normal_wins = 0
				for _, w in ipairs(vim.api.nvim_list_wins()) do
					local cfg = vim.api.nvim_win_get_config(w)
					if cfg.relative == "" then -- not a floating window
						local buf = vim.api.nvim_win_get_buf(w)
						local ft = vim.bo[buf].filetype
						if ft ~= "neo-tree" then
							normal_wins = normal_wins + 1
						end
					end
				end
				vim.cmd("BufDel")
				if #wins == 1 and normal_wins > 1 then
					vim.cmd("close")
				end
			end,
			desc = "Close buffer",
		},
		{ "<leader>X", ":BufDelOthers<CR>", desc = "Close other buffers" },
		vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" }),
		vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" }),
		vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" }),
		vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" }),
		vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" }),
		vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { desc = "Go to buffer 6" }),
		vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { desc = "Go to buffer 7" }),
		vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { desc = "Go to buffer 8" }),
		vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { desc = "Go to buffer 9" }),
	},
}
