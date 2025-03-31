return { 
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    config = function()
        vim.g.indent_blankline_use_treesitter = true

        local ibl = require("ibl")
        local highlight = {
            "Whitespace",
            "Function",
            "Label",
        }

        ibl.setup({
            indent = { 
                char = "" 
            },
            whitespace = {
                highlight = highlight,
            },
            scope = {
                enabled = true
            },
        })
    end,

}
