return {
	"vimtex",
	for_cat = "latex",
	before = function(plugin)
		vim.g.tex_flavor = 'latex'
		vim.g.vimtex_fold_enabled = '1'
		vim.g.vimtex_fold_manual = '1'
		vim.g.compiler_method = 'latexmk'
		vim.g.vimtex_view_method = 'zathura'
		vim.g.vimtex_quickfix_mode = '2'
		vim.g.vimtex_quickfix_open_on_warning = '0'
	end,
}
