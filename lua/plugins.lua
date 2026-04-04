return {
    {'ThePrimeagen/vim-be-good'},
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
    { "tpope/vim-surround" },
    { 'nvim-mini/mini.pairs', version = false,
        config = function ()
            require('mini.pairs').setup()
        end
    },
    { "windwp/nvim-ts-autotag", opts = {} },
}
