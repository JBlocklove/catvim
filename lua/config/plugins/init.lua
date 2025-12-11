-- Notify setup
local ok, notify = pcall(require, "notify")
if ok then
  notify.setup{
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { focusable = false })
    end,
	timeout = 10000,
	minimum_width = 30,
	max_width = 50,
	render = "wrapped-compact",
  }
  vim.notify = notify
  vim.keymap.set("n", "<Esc>", function()
      notify.dismiss({ silent = true, })
  end, { desc = "dismiss notify popup and clear hlsearch" })
end

-- load configs for startupPlugins
require("config.plugins.catppuccin")

-- lze loading
require("lze").load {
	{ import = "config.plugins.completion" },
	{ import = "config.plugins.luasnip" },
	{ import = "config.plugins.markdown" },
	{ import = "config.plugins.latex" },
	{ import = "config.plugins.lualine" },
	{ import = "config.plugins.telescope" },
	{ import = "config.plugins.treesitter" },
	{ import = "config.plugins.bufferline" },
	{ import = "config.plugins.gitsigns" },
	{ import = "config.plugins.tmux" },
	{ import = "config.plugins.trouble" },
	{ import = "config.plugins.indent" },
	{ import = "config.plugins.colorizer" },
	{ import = "config.plugins.autoclose" },
	{ import = "config.plugins.eyeliner" },
	{ import = "config.plugins.undotree" },
	{ import = "config.plugins.comment" },
	{ import = "config.plugins.whichkey" },
	{ import = "config.plugins.fidget" },
}
vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = false })


