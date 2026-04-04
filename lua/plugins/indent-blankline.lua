return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "│",
        },
        scope = {
            enabled = true,
            show_start = false,
            show_end = false,
            priority = 1,
            include = {
                node_type = {
                    ["*"] = {
                        "if_statement",
                        "function",
                        "function_definition",
                        "function_declaration",
                        "arrow_function",
                        "for_statement",
                        "while_statement",
                        "do_block",
                        "table_constructor",
                        "class_definition",
                        "method_definition",
                        "block",
                    },
                },
            },
        },
    },
    config = function(_, opts)
        require("ibl").setup(opts)
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2a2a3f" })
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#569CD6" })
    end
}
