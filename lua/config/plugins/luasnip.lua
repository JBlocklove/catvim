return {
	{
		"luasnip",
		for_cat = "general.blink",
		dep_of = { "blink.cmp" },
		after = function ()
			local luasnip = require "luasnip"
			local snippet_paths = vim.api.nvim_get_runtime_file("lua/config/snippets", true)[1]
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").lazy_load{
				paths = snippet_paths
			}
			luasnip.config.setup {}
		end,
	},
}
