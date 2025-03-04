local base16_colorscheme = require('base16-colorscheme')
base16_colorscheme.with_config({
  telescope = true,
  telescope_borders = true,
  cmp = true,
})

local colorscheme = "base16-tomorrow-night-eighties"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- Show the vertical line between buffers as a thick, dim line instead of a thin bright one
vim.cmd [[hi VertSplit guifg=#515151 guibg=#515151]]
