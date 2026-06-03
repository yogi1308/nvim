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

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})

		-- Run current python file
		vim.keymap.set("n", "<leader>pr", function()
			local file = vim.fn.expand("%")
			vim.cmd("botright split | resize 10 | terminal python3 " .. file)
		end, { desc = "Run current python file" })
	end,
}
