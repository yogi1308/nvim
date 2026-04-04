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
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative numbers" })
