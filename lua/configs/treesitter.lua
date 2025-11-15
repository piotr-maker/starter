local options = {
  ensure_installed = {
    "c", "lua", "luadoc", "markdown", "printf", "toml", "vim", "vimdoc"
  },
  
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
