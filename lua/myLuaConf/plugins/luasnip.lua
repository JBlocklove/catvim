return {
	{
		"luasnip",
		for_cat = "general.blink",
		dep_of = { "blink.cmp" },
		after = function ()
			local luasnip = require 'luasnip'
			require('luasnip.loaders.from_vscode').lazy_load()
			luasnip.config.setup {}

			local ls = require('luasnip')
			local s = ls.snippet
			local t = ls.text_node
			local i = ls.insert_node

			ls.add_snippets("lua", {
				s("hello", {
					t('print("hello world")')
				})
			})
		end,
	},
}
