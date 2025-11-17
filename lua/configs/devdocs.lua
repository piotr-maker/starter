return {
  telescope = {},
  -- Configuration options
  float_win = {
    relative = "editor",
    height = 30,
    width = 80,
    border = "rounded",
  },
  wrap = false,
  previewer_cmd = nil, -- Optional: for markdown preview
  picker_cmd = true, -- Use telescope picker
  ensure_installed = {"cpp"},
}
