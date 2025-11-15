require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

function inlay_hint()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end
  end
end

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>ih", inlay_hint, {desc = "[I]nlay [H]ints"})
map("n", "<leader>rn", vim.lsp.buf.rename, {desc = "[R]e[n]ame"})
map("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "[C]ode [A]ction"})
map("n", "<leader>gr", vim.lsp.buf.references, {desc = "[G]oto [R]eferences"})
map("n", "<leader>gd", vim.lsp.buf.definition, {desc = "[G]oto [D]efinition"})
map("n", "<leader>gi", vim.lsp.buf.implementation, {desc = "[G]oto [I]mplementation"})
map("n", "<leader>gx", "<cmd>Telescope diagnostics<CR>", {desc = "lsp diagnostics"})

