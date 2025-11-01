vim.keymap.set("n", "K", function()
  local symbol = vim.fn.expand("<cword>")
  local line = vim.fn.getline(".")

  -- spróbuj znaleźć nazwę pakietu lub obiektu
  local pkg = line:match("([%w_]+)%s*%.%s*" .. symbol)

  -- domyślne zapytanie
  local query = symbol

  -- przypadek: time.Weekday
  if pkg then
    query = pkg .. "." .. symbol
  end

  -- przypadek: time.Now().Weekday()
  -- spróbuj dopasować wzorzec typu: time%.Now%().%s*(%w+)
  local complex_pkg, method = line:match("([%w_]+)%.[%w_]+%s*%([^)]*%)%s*%.%s*(%w+)")
  if method and method == symbol then
    -- Spróbuj zgadnąć typ zwracany przez funkcję - np. time.Now() → time.Time
    if complex_pkg == "time" and line:find("Now") then
      query = "time.Time." .. symbol
    else
      query = complex_pkg .. "." .. symbol
    end
  end

  local output = vim.fn.systemlist("go doc " .. query)
  if vim.v.shell_error ~= 0 or #output == 0 then
    -- fallback do LSP hover jeśli nic nie znaleziono
    vim.lsp.buf.hover()
    return
  end

  vim.lsp.util.open_floating_preview(output, "go", { border = "rounded" })
end, { buffer = true, desc = "Show Go doc (smart version)" })

