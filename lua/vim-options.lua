vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load project-local .nvimrc/.exrc/.nvim.lua from the current directory
vim.o.exrc = true

-- Tab settings
vim.cmd("set expandtab") -- use spaces instead of tabs
vim.cmd("set tabstop=4") -- tab = 4 spaces
vim.cmd("set softtabstop=4") -- backspace deletes 4 spaces
vim.cmd("set shiftwidth=4") -- indent = 4 spaces

-- Show inline diagnostics
vim.diagnostic.config({
	virtual_text = true,
})

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable line wrap
vim.o.wrap = false

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Highlight yanked text briefly
-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
	end,
})

-- Toggle relative line numbers
vim.keymap.set("n", "<leader>rn", function()
	vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative numbers" })

-- Persistent undo history across sessions
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Open terminal in bottom split (40% height)
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("botright split")
	vim.cmd("resize " .. math.floor(vim.o.lines * 0.4))
	vim.cmd("terminal")
	vim.cmd("startinsert")
end, { desc = "Open terminal" })

-- Keep cursor 10 lines from top/bottom edge when scrolling
vim.opt.scrolloff = 10

-- Clear search highlights
vim.keymap.set("n", "<C-l>", "<cmd>nohlsearch<CR><C-l>", { desc = "Redraw and clear highlights" })

-- Auto-save when leaving insert mode or text changes
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = "*",
	callback = function()
		if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
			vim.cmd("silent! write")
		end
	end,
})

-- Replace word under cursor in current file (with confirmation)
vim.keymap.set("n", "<leader>ss", function()
	local word = vim.fn.expand("<cword>")
	local replace = vim.fn.input("Replace '" .. word .. "' with: ")
	if replace ~= "" then
		vim.cmd(string.format("%%s/\\<%s\\>/%s/gc", word, replace))
	end
end)

-- Move line up/down in normal mode
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })

-- Move selection up/down in visual mode
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Copy entire file to system clipboard
vim.keymap.set("n", "<leader>ya", 'gg"+yG', { desc = "Copy entire file to system clipboard" })

-- Visual entire file to system clipboard
vim.keymap.set("n", "<leader>va", 'ggVG', { desc = "Copy entire file to system clipboard" })

-- delete all the content from the file
vim.keymap.set("n", "<leader>da", 'gg"+dG', { desc = "delete all the content from the file" })

-- Yank to system clipboard (supports motions e.g. <leader>yG, <leader>y$)
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- Pick compiler based on file extension (.c -> gcc, else g++)
local function compiler_for(file)
	return file:match("%.c$") and "gcc" or "g++"
end

vim.keymap.set("n", "<leader>cb", function()
	local file = vim.fn.expand("%")
	local out = vim.fn.expand("%:r")
	local comp = compiler_for(file)
	vim.cmd("botright split | resize 10 | terminal " .. comp .. " -g -o " .. out .. " " .. file)
end, { desc = "Compile current C/C++ file" })

-- Run current C/C++ executable
vim.keymap.set("n", "<leader>cr", function()
	local out = vim.fn.expand("%:r")
	vim.cmd("botright split | resize 10 | terminal ./" .. out)
end, { desc = "Run current C/C++ file" })

-- Compile and run current C/C++ file
vim.keymap.set("n", "<leader>cx", function()
	local file = vim.fn.expand("%")
	local out = vim.fn.expand("%:r")
	local comp = compiler_for(file)
	vim.cmd("botright split | resize 10 | terminal " .. comp .. " -g -o " .. out .. " " .. file .. " && ./" .. out)
end, { desc = "Compile and run current C/C++ file" })

-- Compile and run current file in a floating terminal
local run_float = { win = nil, buf = nil }

vim.keymap.set("n", "<leader>ct", function()
	if run_float.win and vim.api.nvim_win_is_valid(run_float.win) then
		vim.api.nvim_set_current_win(run_float.win)
		return
	end

	local file = vim.fn.expand("%")
	local comp = compiler_for(file)
	local exe = vim.fn.fnamemodify(file, ":p:r")
	local cmd = comp
		.. " -g -o "
		.. vim.fn.shellescape(exe)
		.. " "
		.. vim.fn.shellescape(file)
		.. " && "
		.. vim.fn.shellescape(exe)

	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.max(60, math.floor(vim.o.columns * 0.75))
	local height = math.max(15, math.floor(vim.o.lines * 0.75))
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
		title = " Compile & Run ",
	})
	run_float.win, run_float.buf = win, buf

	local function close_float()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
		if vim.api.nvim_buf_is_valid(buf) then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
		run_float.win, run_float.buf = nil, nil
	end

	local map_opts = { buffer = buf, nowait = true, silent = true }
	vim.keymap.set("t", "<Esc>", close_float, map_opts)
	vim.keymap.set("t", "<C-c>", close_float, map_opts)

	vim.fn.termopen({ "sh", "-c", cmd })
end, { desc = "Compile and run in floating terminal" })

-- blinking block cursor
vim.opt.guicursor = "n-v-c:block-blinkon500-blinkoff500-blinkwait500,i-ci-ve:ver25,r-cr:hor20"

-- paste over selection without overwriting yank register
vim.keymap.set("v", "<leader>r", '"_dP', { desc = "Paste without overwriting yank register" })

-- delete to black hole register (preserves yank register)
vim.keymap.set({ "n", "v" }, "<leader>dd", '"_d', { desc = "Delete without overwriting yank register" })

-- Moving Buffer(tabs) left or rigt with alt
vim.keymap.set("n", "<A-l>", ":BufferLineMoveNext<CR>", { desc = "Move buffer(tabs) right" })
vim.keymap.set("n", "<A-h>", ":BufferLineMovePrev<CR>", { desc = "Move buffer(tabs) left" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>yD", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local diags = vim.diagnostic.get(bufnr)
	if #diags == 0 then
		vim.notify("No diagnostics", vim.log.levels.WARN)
		return
	end

	local lines = {}
	for _, d in ipairs(diags) do
		local msg = d.message:gsub("\n", " ") -- flatten multiline
		table.insert(lines, string.format("Line %d: %s", d.lnum + 1, msg))
	end

	local text = table.concat(lines, "\n")
	vim.fn.setreg("+", text)
	vim.fn.setreg('"', text) -- fallback for no clipboard provider
	vim.notify(string.format("Copied %d diagnostics", #diags), vim.log.levels.INFO)
end)


vim.keymap.set('n', '<leader>dq', function()
  vim.diagnostic.setqflist()
  vim.cmd('copen')
end)

-- Stage everything (instant, no AI)
vim.keymap.set("n", "<leader>ga", function()
  vim.system({ "git", "add", "-A" }, { text = true }, vim.schedule_wrap(function(obj)
    if obj.code == 0 then
      vim.notify("Staged all changes", vim.log.levels.INFO, { title = "git" })
    else
      vim.notify(obj.stderr, vim.log.levels.ERROR, { title = "git" })
    end
  end))
end, { desc = "Git: stage all" })

-- Ask OpenCode to write a message and commit whatever's currently staged
vim.keymap.set("n", "<leader>gc", function()
  require("opencode").ask(
      "Look at `git diff --cached` and `git log --oneline -10` for context on how previous commits are structured. "
      .. "Write a conventional commit message in this exact format:\n"
      .. "1. A short subject line: `type: brief summary` (e.g. `feat:`, `fix:`, `refactor:`, `chore:`)\n"
      .. "2. A blank line\n"
      .. "3. A bullet list of the specific changes, one per line, starting with `- `\n"
      .. "Keep each bullet concise. Do not write a single long line. "
      .. "Do not stage anything else, and do not push. "
      .. "Run `git commit` with the message."
  )
end, { desc = "OpenCode: commit staged changes" })

-- Push (instant, no AI) — gP, not gp (gitsigns owns gp for preview_hunk)
vim.keymap.set("n", "<leader>gP", function()
  vim.system({ "git", "push" }, { text = true }, vim.schedule_wrap(function(obj)
    if obj.code == 0 then
      vim.notify("Pushed", vim.log.levels.INFO, { title = "git" })
    else
      vim.notify(obj.stderr, vim.log.levels.ERROR, { title = "git" })
    end
  end))
end, { desc = "Git: push" })

