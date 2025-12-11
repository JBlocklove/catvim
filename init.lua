-- Make sure nixCats works on non-Nix systems
require("nixCatsUtils").setup { non_nix_value = true }
require("config.non_nix_download")

-- Points to the normal lua config
require("config")
