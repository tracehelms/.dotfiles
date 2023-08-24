vim.g.UltiSnipsSnippetDirectories = { "~/.dotfiles/vim/UltiSnips" }

vim.g.UltiSnipsExpandTrigger = "<S-Tab>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsListSnippets = "<c-s>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-h>"




local opts = { noremap = true } -- , silent = true }
local keymap = vim.api.nvim_set_keymap
vim.api.nvim_set_keymap("n", "<Leader>ue", "UltiSnipsEdit<CR>", opts)
