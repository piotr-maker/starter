function _G.FoldColumnIcon(lnum)
  -- Works only on real modifiable files
  local virtnum = vim.v.virtnum
  if vim.bo.buftype ~= "" or not vim.bo.modifiable or virtnum ~= 0 then
    return ""
  end

  local foldlevel = vim.fn.foldlevel
  local foldclosed = vim.fn.foldclosed

  local prev = foldlevel(lnum - 1)
  local curr = foldlevel(lnum)

  local fc = vim.opt.fillchars:get()
  local open  = fc.foldopen  or ""
  local close = fc.foldclose or ""

  if curr > prev then
    if foldclosed(lnum) == -1 then
      return open .. " ┃"
    else
      return close .. " ┃"
    end
  end

  return "  ┃"
end

