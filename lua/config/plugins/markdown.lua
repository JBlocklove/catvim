return {
	{
		"markdown-preview.nvim",
    	for_cat = 'markdown',
    	cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle", },
    	ft = "markdown",
    	keys = {
    	  {"<leader>mp", "<cmd>MarkdownPreview <CR>", mode = {"n"}, noremap = true, desc = "markdown preview"},
    	  {"<leader>ms", "<cmd>MarkdownPreviewStop <CR>", mode = {"n"}, noremap = true, desc = "markdown preview stop"},
    	  {"<leader>mt", "<cmd>MarkdownPreviewToggle <CR>", mode = {"n"}, noremap = true, desc = "markdown preview toggle"},
    	},
    	before = function()
    	  vim.g.mkdp_auto_close = 0
    	end,
	},
	{
		"markview.nvim",
		for_cat = "markdown",
		ft = "markdown",
		lazy = false,
	},
}
