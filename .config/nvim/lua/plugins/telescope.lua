require("telescope").setup({
	defaults = {
		border = true,
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		file_ignore_patterns = {
			".git/",
			"node_modules/",
		},
	},
})
