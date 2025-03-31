return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local substitute = require("substitute")
        substitute.setup()

        -- keymaps
        local keymap = vim.keymap
        vim.keymap.set("n", "sm", substitute.operator, { desc = "Substitute with motion" })
        vim.keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
        vim.keymap.set("n", "s$", substitute.eol, { desc = "Substitute to end of line" })
        vim.keymap.set("x", "sm", substitute.visual, { desc = "Subsitute in visual mode" })
    end,
}
