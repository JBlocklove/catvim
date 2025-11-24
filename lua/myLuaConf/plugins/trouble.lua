return {
	"trouble.nvim",
	for_cat = "general.extra",
	keys = {
	  {"<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", mode = {"n"}, noremap = true, desc = "Toggle Trougle diagnostics panel"},
	},
	after = function (_)
		require("trouble").setup {
			height = 7,
			auto_open = false,
			auto_close = true,
			use_diagnostic_signs = true,
		}
	end,
}
