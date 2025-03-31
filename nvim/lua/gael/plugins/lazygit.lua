return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- set keybinding for lazy loading of lazygit
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
	},
}
