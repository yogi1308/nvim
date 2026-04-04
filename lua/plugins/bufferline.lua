return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            auto_toggle_bufferline = true,
            indicator = {
                style = 'underline'
            },
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                }
            },
        }
    },
    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" }),
    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
}
