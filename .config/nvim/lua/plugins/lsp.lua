vim.lsp.config("*", {
	root_markers = { ".git" },
})

for name, config in pairs(_G.lsps) do
	vim.lsp.config(name, {
		cmd = config.cmd,
		filetypes = config.filetypes,
	})
	vim.lsp.enable(name)
end
