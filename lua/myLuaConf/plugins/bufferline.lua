return{
	"bufferline.nvim",
	for_cat = "general.ui",
	after = function (plugin)
		local palette = require("catppuccin.palettes").get_palette("mocha")
		require('bufferline').setup{ ---@diagnostic disable-line: redundant-parameter
			options = {
				right_mouse_command = nil,
				left_mouse_command = nil,
				middle_mouse_command = nil,
				indicator = {
					style = 'none'
				},
				diagnostics = true,
				offsets = {
				    {
				        filetype = "NvimTree",
				        text = "File Explorer",
						highlight = "PanelHeading",
						padding = 1,
				        separator = true,
				    },
				},
				color_icons = true, -- whether or not to add the filetype icon highlights
				show_buffer_icons = true, -- disable filetype icons for buffers
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = true,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				sort_by = 'id',
		        max_name_length = 15,
		        tab_size = 15,
				separator_style = {"│", "│"},
			},
			highlights = require("catppuccin.groups.integrations.bufferline").get_theme{
				styles = { "italic", "bold" },
				custom = {
					all = {
						separator = { fg = palette.overlay2 },
					},
				},
			},
		}
	end,
}
