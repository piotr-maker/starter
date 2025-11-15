local M = {}

function M.setup()
  -- Treesitter parser setup
  local ts_config = require("nvim-treesitter.configs")
  local ts_opts = ts_config.get_module("ensure_installed") or {}
  ts_config.setup({
    ensure_installed = vim.list_extend(
      type(ts_opts) == "table" and ts_opts or {},
      { "python" }
    ),
  })

  require("mason-lspconfig").setup({
    ensure_installed = {"pylsp"},
    automatic_instalation = true,
  })

  vim.lsp.config['pylsp'] = {
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
  }
  vim.lsp.enable('pylsp')
end

return M
