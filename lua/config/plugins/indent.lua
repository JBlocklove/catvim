return{
	"indent-blankline.nvim",
	for_cat = "general.ui",
	after = function()
		require("ibl").setup()
	end,
}
