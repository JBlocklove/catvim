return{
    "fidget.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    after = function()
      require('fidget').setup{}
    end,
}
