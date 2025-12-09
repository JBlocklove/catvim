return{
	"autoclose.nvim",
	for_cat = "general.ui",
	after = function()
		require("autoclose").setup{
			options = {
				pair_spaces = true,
			}
		}
	end,
}
