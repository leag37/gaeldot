return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	event = "VeryLazy",
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()

			local opts = {
				buffer = true,
				silent = true,
			}

			local keymap = vim.keymap
			opts.desc = "Run/continue the debugger"
			keymap.set("n", "<F5>", "<cmd>DapContinue<CR>", opts)

			opts.desc = "Step over the current scope"
			keymap.set("n", "<F10>", "<cmd>DapStepOver<CR>", opts)

			opts.desc = "Step over the current scope"
			keymap.set("n", "<leader>kl", "<cmd>DapStepOver<CR>", opts)

			opts.desc = "Step into the current scope"
			keymap.set("n", "<F11>", "<cmd>DapStepInto<CR>", opts)

			opts.desc = "Step into the current scope"
			keymap.set("n", "<leader>kj", "<cmd>DapStepInto<CR>", opts)

			opts.desc = "Step out of the current scope"
			keymap.set("n", "<S-F11>", "<cmd>DapStepOut<CR>", opts)

			opts.desc = "Step out of the current scope"
			keymap.set("n", "<leader>kk", "<cmd>DapStepOut<CR>", opts)

			opts.desc = "Terminate the current debugging session"
			keymap.set("n", "<S-F5>", "<cmd>DapTerminate<CR>", opts)

			opts.desc = "Terminate the current debugging session"
			keymap.set("n", "<leader>kq", "<cmd>DapTerminate<CR>", opts)

			opts.desc = "Open the scope window"
			keymap.set("n", "<leader>ksa", function()
				dapui.float_element("scopes", { enter = true })
			end, opts)

			-- Watch information
			opts.desc = "Open watch window"
			keymap.set("n", "<leader>kwo", function()
				dapui.float_element("watches", { enter = true })
			end, opts)

			opts.desc = "Add a watched expression"
			keymap.set("n", "<leader>kwa", function()
				dapui.elements.watches.add()
			end, opts)

			opts.desc = "Remove a watched expression"
			keymap.set("n", "<leader>kwr", function()
				dapui.elements.watches.remove()
			end, opts)
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		local keymap = vim.keymap
		keymap.set("n", "<F9>", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle a breakpoint" })
		keymap.set("n", "<leader>kb", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle a breakpoint" })
	end,
}
