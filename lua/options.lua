require "nvchad.options"
require "configs.fold"

vim.opt.winborder = 'rounded'

-- folding
vim.opt.foldlevel   = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn  = "0"
vim.opt.foldnestmax = 9
vim.opt.foldenable = true
vim.opt.foldtext = ""

vim.opt.fillchars = {
  eob = " ",
  foldopen = "⮟",
  foldclose = "⮞",
}
vim.opt.statuscolumn = "%s%l %{v:lua.FoldColumnIcon(v:lnum)}"

