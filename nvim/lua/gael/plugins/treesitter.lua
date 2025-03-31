return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" }, -- For when we open an existing file or new file
    build = ":TSUpdate", -- Update language parsers whenever we update this
    depencencies = { 
        "windwp/nvim-ts-autotag",
    },
    config = function()
        -- Import plugin
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            -- Enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- Indentation
            indent = {
                enable = true,
            },
            -- Auto-tagging
            autotag = {
                enable = true,
            },
            -- Ensure language parsers are installed
            ensure_installed = {
                "bash",
                "c",
                "c_sharp",
                "cmake",
                "cpp",
                "css",
                "csv",
                "cuda",
                "disassembly",
                "dockerfile",
                "doxygen",
                "gdscript",
                "git_config",
                "gitcommit",
                "gitignore",
                "glsl",
                "hlsl",
                "http",
                "java",
                "javascript",
                "json",
                "kotlin",
                --"latex",
                "llvm",
                "lua",
                "make",
                "markdown", -- experimental
                "markdown_inline", -- experimental
                "powershell",
                "proto",
                "python",
                "regex",
                "sql",
                "tmux",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end,
}
