return {
	"trouble.nvim",
	for_cat = "general.extra",
	keys = {
	  {"<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", mode = {"n"}, noremap = true, desc = "Toggle Trougle diagnostics panel"},
	},
	after = function(_)
		require("trouble").setup {
			height = 7,
			auto_open = false,
			auto_close = true,
			use_diagnostic_signs = true,
		}
	end,
}
-- -- Trouble
-- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
-- vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
-- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
-- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
-- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)

