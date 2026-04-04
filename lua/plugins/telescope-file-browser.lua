return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        local fb_actions = require("telescope._extensions.file_browser.actions")
        vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "Open telescope-file-browser and set the selected folder as cwd for neo-tree"})
        require("telescope").setup {
            extensions = {
                file_browser = {
                    hidden = false,
                    mappings = {
                        ["i"] = {},
                        ["n"] = {
                            ["<leader>nh"] = fb_actions.toggle_hidden,
                            ["o"] = function(prompt_bufnr)
                                local selection = require("telescope.actions.state").get_selected_entry()
                                require("telescope.actions").close(prompt_bufnr)
                                if selection and selection.Path:is_dir() then
                                    local path = selection.Path:absolute()
                                    vim.cmd("cd " .. path)
                                    vim.cmd("Neotree " .. path)
                                end
                            end,
                        },
                    },
                },
            },
        }
        require("telescope").load_extension("file_browser")
    end
}
