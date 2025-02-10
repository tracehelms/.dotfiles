local fn = vim.fn

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "nvim-lua/popup.nvim" },   -- An implementation of the Popup API from vim in Neovim
    { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
    { "RRethy/base16-nvim" },    -- Lots of base16 colorschemes

    -- cmp plugins
    { "hrsh7th/nvim-cmp" },     -- The completion plugin
    { "hrsh7th/cmp-nvim-lsp" }, -- lsp completions
    { "hrsh7th/cmp-buffer" },   -- buffer completions
    { "hrsh7th/cmp-path" },     -- path completions
    { "hrsh7th/cmp-cmdline" },  -- cmdline completions

    -- snippets
    { "SirVer/ultisnips" },
    { "quangnguyen30192/cmp-nvim-ultisnips" },

    -- LSP
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "seblj/nvim-echo-diagnostics" },
    { "mfussenegger/nvim-lint" },
    { "stevearc/conform.nvim" },

    -- other
    { 'numToStr/Comment.nvim',              opts = {} },
    { "preservim/nerdtree" },
    { "nvim-tree/nvim-web-devicons",        opts = {} },
    { 'nvim-lualine/lualine.nvim',          dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'nvim-telescope/telescope.nvim',      tag = '0.1.8',                                   dependencies = { 'nvim-lua/plenary.nvim' } },
    { "tpope/vim-surround" },
    { "tpope/vim-fugitive" },
    { "vim-test/vim-test" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "base16-tomorrow-night-eighties" } },
  checker = { enabled = false },
})
