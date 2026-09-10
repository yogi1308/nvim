return {
	{
		"prjctimg/p5.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("p5").setup({
				server = {
					port = 8000,
					auto_open_browser = true,
					live_reload = {
						enabled = true,
						port = 12002,
						debounce_ms = 300,
						watch_extensions = { ".js", ".css", ".html", ".json" },
						exclude_dirs = { ".git", "node_modules", "dist", "build" },
					},
				},
				sketch = {
					mode = nil, -- "global" | "instance" | nil
				},
				p5 = {
					version = nil,
					check_update = true,
				},
				libraries = {
					auto_update = false,
				},
				sketchbook = {
					user = "",
				},
				cdp = {
					enabled = false, -- auto-enabled when :P5 cdp opens the panel
					remote_debugging_port = 9222,
					keymaps = true,
					close_browser_on_close = true,
					browser_flags = {
						"--enable-gpu-rasterization",
						"--disable-frame-rate-limit",
						"--disable-gpu-driver-bug-workarounds",
						"--enable-precise-memory-info",
						"--disable-software-rasterizer",
					},
				},
				view = {
					position = "below",
					height = 10,
				},
			})
		end,
		-- Defer keybinds until plugin loads; uses <leader>5 prefix to avoid
		-- clashing with your existing <leader>ps/<leader>pS (persistence session)
		keys = {
			{ "<leader>p5", "<cmd>P5<cr>", desc = "p5: open menu" },
			{ "<leader>pc", "<cmd>P5 create ", desc = "p5: create sketchspace" },
			{ "<leader>ps", "<cmd>P5 setup<cr>", desc = "p5: setup assets in current dir" },
			{ "<leader>pv", "<cmd>P5 server<cr>", desc = "p5: toggle dev server" },
			{ "<leader>pd", "<cmd>P5 cdp<cr>", desc = "p5: toggle CDP DevTools" },
			{ "<leader>pD", "<cmd>P5 docs<cr>", desc = "p5: search docs" },
			{ "<leader>pi", "<cmd>P5 install ", desc = "p5: install library" },
			{ "<leader>pu", "<cmd>P5 uninstall ", desc = "p5: uninstall library" },
			{ "<leader>pU", "<cmd>P5 update<cr>", desc = "p5: update libraries" },
			{ "<leader>pg", "<cmd>P5 gist ", desc = "p5: create/sync gist" },
			{ "<leader>pG", "<cmd>P5 gist sync<cr>", desc = "p5: gist sync" },
		},
	},
}
