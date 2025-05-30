return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"antosha417/nvim-lsp-file-operations",
			config = true,
		},
		{
			"folke/neodev.nvim",
			opts = {},
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- keymaps
		local keymap = vim.keymap
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- buffer local mappings
				-- see :help vim.lsp.* for more documentation
				local opts = {
					buffer = ev.buf,
					silent = true,
				}

				-- set keymaps
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show LSP references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show LSP definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "Show LSP workspace symbols"
				keymap.set("n", "gS", "<cmd>Telescope lsp_workspace_symbols<CR>", opts) -- show lsp workspace symbols

				opts.desc = "Show LSP document symbols"
				keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", opts) -- show lsp document symbols

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- show definition, references

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telessope diagnostics bufrn=0<CR>", opts) -- show diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to next diagnostics"
				keymap.set("n", "[d", vim.diagnostic.goto_next, opts) -- go to next diagnostics

				opts.desc = "Go to previous diagnostics"
				keymap.set("n", "]d", vim.diagnostic.goto_prev, opts) -- go to prev diagnostics

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show documentation for whatever is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- restart lsp
			end,
		})

		-- enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change diagnostics symbols in the sign column (gutter)
		local signs = {
			Error = " ",
			Warn = " ",
			Hint = "󰠠 ",
			Info = " ",
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, {
				text = icon,
				texthl = hl,
				numhl = "",
			})
		end

		vim.lsp.config("clangd", {
			-- settings
			cmd = require("tasks.cmake_utils.cmake_utils").currentClangdArgs(),
		})
		--       vim.lsp.config()
		-- mason_lspconfig.setup_handlers({
		-- 	function(server_name)
		-- 		lspconfig[server_name].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	["clangd"] = function()
		-- 		lspconfig["clangd"].setup({
		-- 			capabilities = capabilities,
		-- 			on_attach = function(client, bufnr)
		-- 				client.server_capabilities.signatureHelpProvider = false
		-- 				-- on_attach(client, bufnr)
		-- 			end,
		-- 			cmd = require("tasks.cmake_utils.cmake_utils").currentClangdArgs(),
		-- 		})
		-- 	end,
		-- })
	end,
}
