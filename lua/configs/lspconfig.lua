require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local servers = { "gopls", "pylsp", "vala_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

require('lspconfig').clangd.setup({
  cmd = {
    "/usr/bin/clangd-20",
    "--clang-tidy",
    -- "--experimental-modules-support",
    "--completion-style=detailed",
  },
})

require('lspconfig').pylsp.setup({
  cmd = { "pylsp" },
  filetypes = { "python" },
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = true },
        pycodestyle = { enabled = true },
        mccabe = { enabled = true },
        pylint = { enabled = true },
        yapf = { enabled = false },
        autopep8 = { enabled = false },
      }
    }
  }
})

require('lspconfig').gopls.setup({
  cmd = { "gopls" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        unreachable = true,
        nilness = true,
        shadow = true,
        unusedvariable = true
      },
      staticcheck = true,
    }
  }
})

require('lspconfig').vala_ls.setup({
  cmd = { "vala-language-server" },
  filetypes = { "vala" },
  root_dir = require('lspconfig.util')
      .root_pattern(".git", "README.*", "build", "builddir", "."),
})

