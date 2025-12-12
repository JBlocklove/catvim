local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local recursive_itemize
recursive_itemize = function ()
	return sn(
		nil,
		c(1, {
			t(""),
			sn(nil, { t({ "", "\t\\item " }), i(1), d(2, recursive_itemize, {}) }),
		})
	)
end

return{
	s("beg", fmt(
		[[
		\begin{{{}}}
			{}
		\end{{{}}}
		]],
		{
			i(1), i(0), rep(1),
		}
	)),

	s("itemize", fmt(
		[[
		\begin{{itemize}}
			\item {}
			{}
		\end{{itemize}}
		]],
		{
			i(1), d(2, recursive_itemize, {}),
		}
	))
}
