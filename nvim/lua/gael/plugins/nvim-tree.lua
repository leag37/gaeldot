return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- Recommended settings from nvim tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			-- File explorer dimentions
			view = {
				relativenumber = true,
				width = 35,
			},
			-- Folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			-- Disable window picker for explorer so it works well with window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},

			git = {
				ignore = false,
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				-- Important: When you supply an `on_attach` function, nvim-tree won't
				-- automatically set up the default keymaps. To set up the default keymaps,
				-- call the `default_on_attach` function. See `:help nvim-tree-quickstart-custom-mappings`.
				api.config.mappings.default_on_attach(bufnr)

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				local preview = require("nvim-tree-preview")

				vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
				vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))
				vim.keymap.set("n", "<C-f>", function()
					return preview.scroll(4)
				end, opts("Scroll Down"))
				vim.keymap.set("n", "<C-b>", function()
					return preview.scroll(-4)
				end, opts("Scroll Up"))

				-- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
				-- vim.keymap.set("n", "<Tab>", function()
				-- 	local ok, node = pcall(api.tree.get_node_under_cursor)
				-- 	if ok and node then
				-- 		if node.type == "directory" then
				-- 			api.node.open.edit()
				-- 		else
				-- 			preview.node(node, { toggle_focus = true })
				-- 		end
				-- 	end
				-- end, opts("Preview"))

				-- Option B: Simple tab behavior: Always preview
				vim.keymap.set("n", "<Tab>", preview.node_under_cursor, opts("Preview"))
			end,
		})

		-- Keymap for interacting with the explorer
		local keymap = vim.keymap
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeOpen<CR>", { desc = "Open/go to the file explorer" })
		keymap.set("n", "<leader>eq", "<cmd>NvimTreeClose<CR>", { desc = "Close the file explorer" })
		keymap.set("n", "<leader>et", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Find current file in explorer" })
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end,
}
