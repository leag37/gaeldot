return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	event = { "BufReadPre", "BufNewFile" }, -- For when we open an existing file or new file
	depencencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}
