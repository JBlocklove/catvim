return{
    "fidget.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    after = function()
      require('fidget').setup{
		  notification = {
			window = {
		  	    winblend = 0,
		  	    border = "single",
		  	},
		  },
	  }
    end,
}
