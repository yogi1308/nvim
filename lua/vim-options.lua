vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.diagnostic.config({
    virtual_text = true,
})
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.wrap = false
vim.opt.termguicolors = true
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
    end,
})
vim.keymap.set("n", "<leader>rn", function()
    vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative numbers" })
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("botright split")
    vim.cmd("resize " .. math.floor(vim.o.lines * 0.4))
    vim.cmd("terminal")
    vim.cmd("startinsert")
end, { desc = "Open terminal" })
