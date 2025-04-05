return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			-- transparent_background = true,
			default_integrations = true,
			integrations = {
				alpha = true,
				fzf = true,
				mason = false,
				cmp = true,
				dap = true,
				dap_ui = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				nvimtree = true,
				treesitter = true,
				telescope = {
					enabled = true,
				},
				lsp_trouble = false,
				which_key = false,
			},
		})

		-- Dap
		local sign = vim.fn.sign_define
		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

		-- vim.cmd("colorscheme catppuccin")
		vim.cmd.colorscheme("catppuccin")
	end,
}
