require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "lsp code action"})
map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", {desc = "lsp references"})
map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", {desc = "lsp definitions"})
map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", {desc = "lsp implementations"})
map("n", "<leader>gx", "<cmd>Telescope diagnostics<CR>", {desc = "lsp diagnostics"})

map("n", "<leader>dd", "<cmd>DevdocsOpenCurrentFloat<CR>", { desc = "open devdocs" })
