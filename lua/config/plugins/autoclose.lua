return{
	"autoclose.nvim",
	for_cat = "general.ui",
	after = function()
		require("autoclose").setup{
			options = {
				pair_spaces = true,
				disabled_filetypes = { "text", "mail", "markdown" },
			}
		}
	end,
}
