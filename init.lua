-- Make sure nixCats works on non-Nix systems
require("nixCatsUtils").setup { non_nix_value = true }
require("myLuaConf.non_nix_download")

-- Points to the normal lua config
require("myLuaConf")
