return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs.treesitter")
    end
  },

  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
     end,
  },
}
