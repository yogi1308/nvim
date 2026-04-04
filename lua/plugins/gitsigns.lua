return {
    "lewis6991/gitsigns.nvim",
    opts = {},
    keys = {
        { "]h", ":Gitsigns next_hunk<CR>", desc = "Next hunk" },
        { "[h", ":Gitsigns prev_hunk<CR>", desc = "Prev hunk" },
        { "<leader>gs", ":Gitsigns stage_hunk<CR>", desc = "Gitsigns Stage hunk" },
        { "<leader>gr", ":Gitsigns reset_hunk<CR>", desc = "Gitsigns Reset hunk" },
        { "<leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Gitsigns Preview hunk" },
        { "<leader>gb", ":Gitsigns blame_line<CR>", desc = "Gitsigns Blame line" },
        { "<leader>gd", ":Gitsigns diffthis<CR>", desc = "Gitsigns Diff this" },
    }
}
