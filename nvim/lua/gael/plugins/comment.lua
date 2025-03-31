return { 
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local comment = require("Comment")

        -- Enable comments
        comment.setup()
    end
}
