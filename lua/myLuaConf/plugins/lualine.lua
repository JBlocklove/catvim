return {
	"lualine.nvim",
	for_cat = "general.ui",
	event = "DeferredUIEnter",
	after = function (plugin)
		local colors = require("catppuccin.palettes").get_palette("mocha")
		-- local navic = require 'nvim-navic'

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand '%:t') ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand '%:p:h'
				local gitdir = vim.fn.finddir('.git', filepath .. ';')
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		local statusline = {
			options = {
				globalstatus = true,
				theme = {
					normal = {
						a = { fg = colors.text, bg = colors.base },
						b = { fg = colors.text, bg = colors.base },
						c = { fg = colors.text, bg = colors.base },
					},
				},
				component_separators = '',
				section_separators = '',
				disabled_filetypes = {},
				always_divide_middle = true,
			},
			sections = {
				lualine_a = {
					{
						function()
							local mode_color = {
								n = colors.blue,
								i = colors.green,
								v = colors.lavender,
								[''] = colors.lavender,
								V = colors.lavender,
								c = colors.yellow,
								no = colors.blue,
								s = colors.peach,
								S = colors.peach,
								[''] = colors.peach,
								ic = colors.yellow,
								R = colors.lavender,
								Rv = colors.lavender,
								cv = colors.red,
								ce = colors.red,
								r = colors.sky,
								rm = colors.sky,
								['r?'] = colors.sky,
								['!'] = colors.red,
								t = colors.red,
							}
							vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.base)
							return '▊'
						end,
						color = 'LualineMode',
						padding = { left = 0, right = 0 },
					},
				},
				lualine_b = {
					{
						'branch',
						icon = '',
						color = { fg = colors.lavender, gui = 'bold' }
					},
					{
						'diff',
						symbols = { added = ' ', modified = ' ', removed = ' ' },
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.yellow },
							removed = { fg = colors.red },
						},
						cond = conditions.hide_in_width,
					}
				},
				lualine_c = {
					{
						'filename',
						cond = conditions.buffer_not_empty,
						color = { fg = colors.magenta, gui = 'bold' },
					},
				},
				lualine_x = {
					{
						'diagnostics',
						sources = { 'nvim_diagnostic' },
						symbols = { error = ' ', warn = ' ', info = ' ', hint = "󰌵 "},
						diagnostics_color = {
							color_error = { fg = colors.red },
							color_warn = { fg = colors.yellow },
							color_info = { fg = colors.sky },
						}
					},
					{
						function()
							local msg = 'No Active Lsp'
							local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return client.name
								end
							end
							return msg
						end,
						color = { fg = colors.text, gui = 'bold' },
					},
					{
						'filetype', icons_enabled=false
					},
				},
				lualine_y = { 'location' },
				lualine_z = {
					{
						'progress',
						-- color = { fg = colors.fg },
					}
				}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			extensions = {},
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						--navic.get_location,
						--cond = navic.is_available,
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		}
		local lualine = require('lualine')
		lualine.setup(statusline) ---@diagnostic disable-line: redundant-parameter
	end,
}
