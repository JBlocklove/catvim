-- Notify setup
-- local ok, notify = pcall(require, "notify")
-- if ok then
--   notify.setup({
--     on_open = function(win)
--       vim.api.nvim_win_set_config(win, { focusable = false })
--     end,
--   })
--   vim.notify = notify
--   vim.keymap.set("n", "<Esc>", function()
--       notify.dismiss({ silent = true, })
--   end, { desc = "dismiss notify popup and clear hlsearch" })
-- end

-- load configs for startupPlugins
require("myLuaConf.plugins.catppuccin")

-- lze loading
require("lze").load {
	{ import = "myLuaConf.plugins.completion" },
	{ import = "myLuaConf.plugins.markdown" },
	{ import = "myLuaConf.plugins.latex" },
	{ import = "myLuaConf.plugins.lualine" },
	{ import = "myLuaConf.plugins.telescope" },
	{ import = "myLuaConf.plugins.treesitter" },
	{ import = "myLuaConf.plugins.bufferline" },
	{ import = "myLuaConf.plugins.gitsigns" },
	{ import = "myLuaConf.plugins.tmux" },
	{ import = "myLuaConf.plugins.trouble" },
}


