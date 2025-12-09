-- General settings and options
require("myLuaConf.settings")
-- require("myLuaConf.autocmds")

-- Set key mappings
require("myLuaConf.mappings")

require("lze").register_handlers(require("nixCatsUtils.lzUtils").for_cat)
require("lze").register_handlers(require("lzextras").lsp)

require("myLuaConf.plugins")
require("myLuaConf.LSPs")

require("myLuaConf.colorscheme")
