return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	event = "VeryLazy",
	config = function()
		local mason_nvim_dap = require("mason-nvim-dap")
		mason_nvim_dap.setup({
			ensure_installed = {},
			handlers = {},
		})
	end,
}
