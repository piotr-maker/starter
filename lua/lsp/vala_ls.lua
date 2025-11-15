local M = {}

function M.setup()
  require("mason-lspconfig").setup({
    ensure_installed = {"vala-ls"},
    automatic_instalation = true,
  })

  -- Treesitter parser setup  
  local treesitter_config = require("nvim-treesitter.configs")  
  treesitter_config.setup({
    ensure_installed = vim.list_extend(
      treesitter_config.get_config().ensure_installed or {},
      { "vala" }
    ),
  })

  vim.lsp.config['vala_ls'] = {
    cmd = { "vala-language-server" },
    filetypes = { "vala" },
    root_dir = require('lspconfig.util').root_pattern(".git", "README.*", "build", "builddir", "."),
  }
  vim.lsp.enable('vala_ls')
end

return M
