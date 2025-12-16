return {
	"trouble.nvim",
	for_cat = "general.extra",
	keys = {
	  {"<leader>xx", function() require("trouble").toggle("diagnostics") end, mode = {"n"}, noremap = true, desc = "Toggle Trougle diagnostics panel"},
	  {"<leader>xq", function() require("trouble").toggle("quickfix") end, mode = {"n"}, noremap = true, desc = "Toggle Trougle [Q]uickfix panel"},
	  {"<leader>xl", function() require("trouble").toggle("lsp") end, mode = {"n"}, noremap = true, desc = "Toggle Trougle [L]oclist panel"},
	},
	after = function(_)
		require("trouble").setup {
			height = 10,
			auto_open = false,
			auto_close = true,
			auto_preview = false,
			use_diagnostic_signs = true,
		}
	end,
}

