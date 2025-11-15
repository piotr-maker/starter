local M = {}

function M.setup()
  -- Treesitter parser setup
  local ts_config = require("nvim-treesitter.configs")
  local ts_opts = ts_config.get_module("ensure_installed") or {}
  ts_config.setup({
    ensure_installed = vim.list_extend(
      type(ts_opts) == "table" and ts_opts or {},
      { "c", "cpp" }
    ),
  })

  vim.lsp.config['clangd'] = {
    cmd = {
      "/usr/bin/clangd-20",
      "--clang-tidy",
      "--completion-style=detailed",
    },
    root_markers = { '.clangd', 'compile_commands.json', 'build' },
  }  
  vim.lsp.enable('clangd')
end

return M
