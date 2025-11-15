local M = {}

function M.setup()
  -- Treesitter parser setup
  local ts_config = require("nvim-treesitter.configs")
  local ts_opts = ts_config.get_module("ensure_installed") or {}
  ts_config.setup({
    ensure_installed = vim.list_extend(
      type(ts_opts) == "table" and ts_opts or {},
      { "go" }
    ),
  })

  require("mason-lspconfig").setup({
    ensure_installed = {"gopls"},
    automatic_instalation = true,
  })

  vim.lsp.config['gopls'] = {
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
    },
    filetypes = { 'go' },
  }  
  vim.lsp.enable('gopls')
end

return M
