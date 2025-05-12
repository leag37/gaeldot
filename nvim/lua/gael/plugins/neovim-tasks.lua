return {
	"Shatur/neovim-tasks",
	event = "VeryLazy",
	config = function()
		local tasks = require("tasks")
		local Path = require("plenary.path")

		-- Check if we are a cmake project
		local project_config = require("tasks.project_config")
		local cmake_utils = require("tasks.cmake_utils.cmake_utils")
		local cmake_presets = require("tasks.cmake_utils.cmake_presets")

		local cmake_config = project_config:new()["cmake"]
		local cmakelists_dir = cmake_config.source_dir and cmake_config.source_dir or vim.loop.cwd()
		if (Path:new(cmakelists_dir) / "CMakeLists.txt"):exists() then
			local keymap = vim.keymap
			keymap.set("n", "<F3>", "<cmd>Task start cmake configure<CR>", { desc = "Run the CMake configure task" })
			keymap.set(
				"n",
				"<F4>",
				"<cmd>Task start cmake build<CR>",
				{ desc = "Build the currently configured CMake project" }
			)
			keymap.set(
				"n",
				"<F5>",
				"<cmd>Task start cmake debug<CR>",
				{ desc = "Debug the currently configured CMake project" }
			)
			keymap.set(
				"n",
				"<S-F5>",
				"<cmd>Task start cmake run<CR>",
				{ desc = "Run (no debugger) the currently configured CMake project" }
			)
		end

		vim.keymap.set("n", "<leader>cmC", [[:Task start cmake configure<cr>]], { silent = true })
		vim.keymap.set("n", "<leader>cmD", [[:Task start cmake configureDebug<cr>]], { silent = true })
		vim.keymap.set("n", "<leader>cmP", [[:Task start cmake reconfigure<cr>]], { silent = true })
		vim.keymap.set("n", "<leader>cmT", [[:Task start cmake ctest<cr>]], { silent = true })
		vim.keymap.set("n", "<leader>cmK", [[:Task start cmake clean<cr>]], { silent = true })
		vim.keymap.set("n", "<leader>cmt", [[:Task set_module_param cmake target<cr>]], { silent = true })
		vim.keymap.set("n", "<C-c>", [[:Task cancel<cr>]], { silent = true })
		vim.keymap.set("n", "<leader>cmr", [[:Task start cmake run<cr>]], { silent = true })
		vim.keymap.set("n", "<leader>cmd", [[:Task start cmake debug<cr>]], { silent = true })
		vim.keymap.set("n", "<leader>cmb", [[:Task start cmake build<cr>]], { silent = true })
		vim.keymap.set("n", "<leader>cmB", [[:Task start cmake build_all<cr>]], { silent = true })

		local function openOutputWindow()
			local config = require("tasks.config")
			vim.api.nvim_command(string.format("%s copen %d", config.quickfix.pos, config.quickfix.height))
			vim.api.nvim_command("copen")
		end
		local function closeOutputWindow()
			vim.api.nvim_command("cclose")
		end
		vim.keymap.set("n", "<leader>cmX", openOutputWindow, { silent = true })
		vim.keymap.set("n", "<leader>cmx", closeOutputWindow, { silent = true })

		-- open ccmake in embedded terminal
		local function openCCMake()
			local build_dir = tostring(cmake_utils.getBuildDir())
			vim.cmd([[bo sp term://ccmake ]] .. build_dir)
		end
		vim.keymap.set("n", "<leader>cmc", openCCMake, { silent = true, desc = "Open CMake" })

		-- if project is using presets, provide preset selection for both <leader>cmv and <leader>cmk
		-- if not, provide build type (<leader>cmv) and kit (<leader>cmk) selection

		local function selectPreset()
			local availablePresets = cmake_presets.parse("buildPresets")

			vim.ui.select(availablePresets, { prompt = "Select build preset" }, function(choice, idx)
				if not idx then
					return
				end
				local projectConfig = ProjectConfig:new()
				if not projectConfig["cmake"] then
					projectConfig["cmake"] = {}
				end

				projectConfig["cmake"]["build_preset"] = choice

				-- autoselect will invoke projectConfig:write()
				cmake_utils.autoselectConfigurePresetFromCurrentBuildPreset(projectConfig)
			end)
		end

		local function selectBuildKitOrPreset()
			if cmake_utils.shouldUsePresets() then
				selectPreset()
			else
				tasks.set_module_param("cmake", "build_kit")
			end
		end

		vim.keymap.set("n", "<leader>cmk", selectBuildKitOrPreset, { silent = true, desc = "Select build kit" })

		local function selectBuildTypeOrPreset()
			if cmake_utils.shouldUsePresets() then
				selectPreset()
			else
				tasks.set_module_param("cmake", "build_type")
			end
		end

		vim.keymap.set("n", "<leader>cmv", selectBuildTypeOrPreset, { silent = true, desc = "Select build type" })
		tasks.setup({})
	end,
}
