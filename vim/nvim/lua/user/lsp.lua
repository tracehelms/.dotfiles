require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "tsserver",
  }
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

function My_organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

-- Set up LSP servers
require("lspconfig").tsserver.setup {
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      My_organize_imports,
      description = "Organize Imports"
    }
  },
  -- on_attach = function(client, bufnr)
  --     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  -- end
}
require("lspconfig").rust_analyzer.setup {
  capabilities = capabilities
}
require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  }
}

-- linting
local lint = require("lint")
lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  -- rust = { "clippy" },
  -- svelte = { "eslint_d" },
  -- kotlin = { "ktlint" },
  -- terraform = { "tflint" },
  -- ruby = { "standardrb" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

-- formatting
require("conform").setup {
  format_after_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
  formatters_by_ft = {
    -- lua = { "stylua" },
    -- svelte = { { "prettierd", "prettier" } },
    javascript = { "prettier" },
    typescript = { { "prettier" } },
    javascriptreact = { { "prettier" } },
    typescriptreact = { { "prettier" } },
    json = { { "prettier" } },
    -- graphql = { { "prettierd", "prettier" } },
    -- java = { "google-java-format" },
    -- kotlin = { "ktlint" },
    -- ruby = { "standardrb" },
    -- markdown = { { "prettierd", "prettier" } },
    -- erb = { "htmlbeautifier" },
    -- html = { "htmlbeautifier" },
    -- bash = { "beautysh" },
    -- proto = { "buf" },
    rust = { "rustfmt" },
    -- yaml = { "yamlfix" },
    -- toml = { "taplo" },
    css = { { "prettier" } },
    scss = { { "prettier" } },
  },
}

-- -- auto-format on save with conform
-- local format_augroup = vim.api.nvim_create_augroup("format", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = format_augroup,
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })

-- trim trailing whitespace
local whitespace_augroup = vim.api.nvim_create_augroup("whitespace", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = whitespace_augroup,
  pattern = { "*" },
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function() vim.cmd [[%s/\s\+$//e]] end)
    vim.fn.setpos(".", save_cursor)
  end,
})

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local _border = "single"

-- borders on popus
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

-- borders on popus
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config({
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = false,
  underline = true,
  float = {
    border = _border
  },
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({ float = false }) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({ float = false }) end)
-- vim.keymap.set('n', '<Leader>dq', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gsd', ':vsplit | lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', 'T', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<Leader>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<Leader>D', ':vsplit | vim.lsp.buf.type_definition()<CR>', opts)
    -- vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<Leader>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})


-- Don't show messages in a floating window
require("echo-diagnostics").setup {
  show_diagnostic_number = true,
  show_diagnostic_source = true,
}

vim.opt.updatetime = 300
vim.api.nvim_create_autocmd('CursorHold', {
  pattern = "*",
  callback = function() require('echo-diagnostics').echo_line_diagnostic() end
})
-- This will echo the entire diagnostic message. Should prompt you with Press ENTER or type command to continue.
vim.keymap.set("n", "<Leader>d", '<cmd>lua require("echo-diagnostics").echo_entire_diagnostic()<CR>')
