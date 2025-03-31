return {
	"Civitasv/cmake-tools.nvim",
	-- opts = {},
	-- event = "VeryLazy",
	config = function()
		require("cmake-tools").setup({})
	end,
}
