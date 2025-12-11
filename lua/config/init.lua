-- General settings and options
require("config.settings")
-- require("config.autocmds")

-- Set key mappings
require("config.mappings")

require("lze").register_handlers(require("nixCatsUtils.lzUtils").for_cat)
require("lze").register_handlers(require("lzextras").lsp)

require("config.plugins")
require("config.LSPs")

require("config.colorscheme")
