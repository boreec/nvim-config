return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
	  -- The listed parsers MUST always be installed
          ensure_installed = {
	    "go", "gomod", "gosum", "gotmpl", "gowork",
	    "graphql",
	    "json",
	    "lua",
	    "markdown", "markdown_inline",
	    "python",
	    "proto",
	    "rust",
	    "sql",
	    "toml",
	    "typescript",
	    "xml",
	    "yaml"
	  },
	  -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  }
}
