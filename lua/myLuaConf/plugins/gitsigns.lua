return{
	"gitsigns.nvim",
	for_cat = "general.git",
	after = function( plugin )
		require("gitsigns").setup ()
	end,
}
