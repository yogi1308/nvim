return {
    "petertriho/nvim-scrollbar",
    dependencies = { "kevinhwang91/nvim-hlslens" },
    config = function()
        require("scrollbar").setup({
            -- Custom options go here (optional)
            -- excluded_filetypes = { "prompt", "TelescopePrompt", "noice" },
            handlers = {
                gitsigns = true, -- Requires gitsigns.nvim
                search = true,   -- Requires nvim-hlslens
            },
        })
    end,
}

