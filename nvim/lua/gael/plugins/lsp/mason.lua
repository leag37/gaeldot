return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		-- "neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- helpful for installing things that aren't language servers
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- Enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"bashls", -- needs npm/node
				"omnisharp",
				"clangd",
				"cmake",
				"cssls",
				"dockerls",
				-- "glslls", -- needs ninja but won't work for some reason
				"glsl_analyzer",
				"html",
				"lua_ls",
				"marksman",
				"opencl_ls",
				"buf_ls",
				"pylsp",
				"ts_ls",
				-- "slang", -- shaders (not recognized in list but can be manually installed)
				"vimls",
				"lemminx",
				"yamlls",
				-- linters
				-- "cpplint",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- formatters
				"prettier", -- prettier formatter (buncha stuff)
				"stylua", -- lua
				"isort", -- python
				"black", -- python
				"clang-format", -- c/c++
				"cmakelang", -- cmake
				"csharpier",
				-- linters
				"eslint_d",
				"pylint",
				"cpplint",
				"markdownlint",
				"codelldb",
				"cmakelint",
				-- "glslc",
			},
		})

		-- Enable all individual languages as necessary
		-- require'lspconfig'.glslls.setup{}
	end,
}
