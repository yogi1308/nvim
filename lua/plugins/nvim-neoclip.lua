return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    -- you'll need at least one of these
    -- {'nvim-telescope/telescope.nvim'},
    -- {'ibhagwan/fzf-lua'},
  },
  config = function()
    require('neoclip').setup()
  end,
  vim.keymap.set("n", "<leader>fr", ":Telescope neoclip<CR>", { desc = "Dismiss notifications" })
}
