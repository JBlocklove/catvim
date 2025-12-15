return{
	"comment.nvim",
	for_cat = "general.extra",
    event = "DeferredUIEnter",
	after = function()
		require("Comment").setup{
			toggler = {
				line = "<leader>cc",
				block = "<leader>bc"
			},
			opleader = {
				line = "<leader>c",
				block = "<leader>b"
			},
			mappings = {
				basic = true,
				extra = false
			},
		}
	end,
}
