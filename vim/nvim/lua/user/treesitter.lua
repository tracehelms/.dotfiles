-- require 'nvim-treesitter'.setup {
--   -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
--   install_dir = vim.fn.stdpath('data') .. '/site'
-- }
--
-- require 'nvim-treesitter'.install { 'rust', 'javascript', 'typescript', 'elixir', 'gleam', 'go', 'markdown', 'lua' }
--
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { '<filetype>' },
--   callback = function() vim.treesitter.start() end,
-- })
--
-- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- vim.wo[0][0].foldmethod = 'expr'



local ts = require("nvim-treesitter")

local ensure_installed = {
  "lua",
  "javascript",
  "typescript",
  "json",
  "markdown",
  "rust",
  "elixir",
  "go",
  "gleam",
}

local already_installed = ts.get_installed()

local to_install = vim.iter(ensure_installed)
  :filter(function(parser)
    return not vim.tbl_contains(already_installed, parser)
  end)
  :totable()

if #to_install > 0 then
  ts.install(to_install)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = ensure_installed,
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldmethod = "expr"
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
