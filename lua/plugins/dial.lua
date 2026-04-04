return {
    "monaqa/dial.nvim",
    keys = {
        { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, desc = "Increment" },
        { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, desc = "Decrement" },
        { "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, mode = "v", desc = "Increment" },
        { "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, mode = "v", desc = "Decrement" },
    },
    config = function()
        local augend = require("dial.augend")
        require("dial.config").augends:register_group {
            default = {
                augend.integer.alias.decimal,
                augend.integer.alias.hex,
                augend.constant.alias.bool,
                augend.constant.alias.Bool,
                augend.constant.new { elements = { "&&", "||" }, word = false, cyclic = true },
                augend.constant.new { elements = { "and", "or" }, word = true, cyclic = true },
                augend.constant.new { elements = { "on", "off" }, word = true, cyclic = true },
                augend.constant.new { elements = { "yes", "no" }, word = true, cyclic = true },
            },
        }
    end
}
