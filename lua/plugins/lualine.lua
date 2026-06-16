return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup({
            options = {
                theme = "auto"
            },
            sections = {
                lualine_x = {
                    {
                        function()
                            local reg = vim.fn.reg_recording()
                            return reg ~= "" and "recording @" .. reg or ""
                        end,
                        color = { fg = "#ff9e64" },
                    },
                    "encoding",
                    "fileformat",
                    "filetype",
                },
            },
        })
    end
}
