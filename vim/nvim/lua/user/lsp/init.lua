require("mason").setup()
require("mason-lspconfig").setup()

-- Set up LSP servers
require("lspconfig").tsserver.setup {}
require("lspconfig").rust_analyzer.setup {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.eslint,
        -- null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.trim_whitespace
    },
    -- format files on save
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
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


vim.diagnostic.config({
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = false,
  underline = true,
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({float = false}) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({float = false}) end)
-- vim.keymap.set('n', '<Leader>dq', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--     -- Buffer local mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--     -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     -- vim.keymap.set('n', '<space>wl', function()
--     --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     -- end, opts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--     -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     -- vim.keymap.set('n', '<space>f', function()
--       vim.lsp.buf.format { async = true }
--     end, opts)
--   end,
-- })


-- Don't show messages in a floating window
require("echo-diagnostics").setup{
  show_diagnostic_number = true,
  show_diagnostic_source = false,
}

vim.opt.updatetime = 300
vim.api.nvim_create_autocmd('CursorHold', { 
  pattern = "*",
  callback = function() require('echo-diagnostics').echo_line_diagnostic() end
})
-- This will echo the entire diagnostic message. Should prompt you with Press ENTER or type command to continue.
vim.keymap.set("n", "<Leader>d", '<cmd>lua require("echo-diagnostics").echo_entire_diagnostic()<CR>')
