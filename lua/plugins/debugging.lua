return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()
		require("dap-go").setup()

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
		dap.configurations.c = dap.configurations.cpp

		dap.adapters.python = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter",
		}
		dap.configurations.python = {
			{
				name = "Launch",
				type = "python",
				request = "launch",
				program = function()
					return vim.fn.getcwd() .. "/" .. vim.fn.expand("%")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				console = "integratedTerminal",
				-- Use project venv python for debugging
				pythonPath = function()
					return require("python_venv").find() or "python3"
				end,
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Debugging keymaps
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "DAP continue / start" })
		vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "DAP step over" })
		vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "DAP step into" })
		vim.keymap.set("n", "<Leader>dO", dap.step_out, { desc = "DAP step out" })
		vim.keymap.set("n", "<Leader>dx", dap.terminate, { desc = "DAP terminate" })
		vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
		vim.keymap.set({ "n", "v" }, "<Leader>de", function()
			dapui.eval()
		end, { desc = "DAP eval expression" })
		vim.keymap.set("n", "<Leader>dC", dap.run_to_cursor, { desc = "DAP run to cursor" })
		vim.keymap.set("n", "<Leader>dT", dap.clear_breakpoints, { desc = "DAP clear all breakpoints" })
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			local widgets = require("dap.ui.widgets")
			local hover = widgets.hover()
			-- close the float as soon as the cursor moves in the source buffer
			vim.api.nvim_create_autocmd({ "CursorMoved", "BufLeave", "WinLeave" }, {
				once = true,
				callback = function()
					if hover and hover.close then
						hover.close()
					end
				end,
			})
		end, { desc = "DAP hover" })
		vim.keymap.set("n", "<leader>pr", function()
			local py = require("python_venv").find() or "python3"
			local file = vim.fn.expand("%")
			vim.cmd(
				"botright split | resize 10 | terminal " .. vim.fn.shellescape(py) .. " " .. vim.fn.shellescape(file)
			)
		end, { desc = "Run current python file" })
	end,
}
