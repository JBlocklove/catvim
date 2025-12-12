return{
	"todo-comments.nvim",
	for_cat = "general.ui",
	keys = {
      {"]t", function() require("todo-comments").jump_next() end, mode = {"n"}, noremap = true, desc = "Next [T]odo Comment"},
      {"[t", function() require("todo-comments").jump_prev() end, mode = {"n"}, noremap = true, desc = "Previous [T]odo Comment"},
	},
	after = function()
		require("todo-comments").setup{}
	end,
}

