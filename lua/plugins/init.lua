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

  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
      "DevdocsFetch",
      "DevdocsInstall",
      "DevdocsUninstall",
      "DevdocsOpen",
      "DevdocsOpenFloat",
      "DevdocsOpenCurrent",
      "DevdocsOpenCurrentFloat",
      "DevdocsUpdate",
      "DevdocsUpdateAll",
    },
    opts = function(_, opts)
      require("configs.devdocs")
    end,
    config = function()
      vim.notify(vim.inspect(opts), vim.log.levels.INFO)
      require("nvim-devdocs").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          if vim.bo.buftype == "nofile" then
            vim.opt_local.conceallevel = 2
            vim.opt_local.concealcursor = "nc"
          end
        end,
      })
    end,
  },
}
