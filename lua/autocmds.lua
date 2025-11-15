vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.foldingRangeProvider then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr   = "v:lua.vim.lsp.foldexpr()"
    end
  end
})

require "nvchad.autocmds"

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    -- Treesitter fallback
    if pcall(require, "nvim-treesitter") then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
    else
      vim.opt.foldmethod = "indent"
    end
  end
})
