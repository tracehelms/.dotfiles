local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap comma as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Saving & quitting
keymap("n", "<Leader>w", ":retab<bar>:w<cr>", opts)   -- changes tabs to spaces and save
keymap("n", "<Leader>wq", ":retab<bar>:wq<cr>", opts) -- changes tabs to spaces, saves, and quits
keymap("n", "<Leader>q", ":q<cr>", opts)              -- quit

-- Colemak window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-n>", "<C-w>j", opts)
keymap("n", "<C-e>", "<C-w>k", opts)
keymap("n", "<C-i>", "<C-w>l", opts)

-- from https://www.ryanheise.com/colemak/
-- noremap n j|noremap <C-w>n <C-w>j|noremap <C-w><C-n> <C-w>j
-- noremap e k|noremap <C-w>e <C-w>k|noremap <C-w><C-e> <C-w>k
-- noremap s h
-- noremap t l
--
-- noremap f e
-- noremap k n
-- noremap K N
-- noremap U <C-r>

keymap("n", "n", "j", opts)
keymap("n", "e", "k", opts)
keymap("n", "s", "h", opts)
keymap("n", "t", "l", opts)

keymap("n", "f", "e", opts)
keymap("n", "k", "n", opts)
keymap("n", "K", "N", opts)
keymap("n", "U", "<C-r>", opts)

-- Qwerty window navigation
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Code toggle folding
keymap("n", "<space>", "za", opts)

-- Easier maximize split
keymap("n", "<C-\\>", "<C-W><bar>", opts)
keymap("n", "<C-=>", "<C-W>=", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Don't yank text that is pasted over
keymap("v", "p", '"_dP', opts)
-- Copy to clipboard
keymap("v", "Y", '"*y', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)

-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- Snippets
vim.api.nvim_set_keymap("n", "<Leader>ue", "UltiSnipsEdit<CR>", opts)


-- fzf
vim.keymap.set("n", "<Bslash>", "<cmd>lua require('fzf-lua').files()<CR>", opts)
vim.keymap.set("n", "<Leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", opts)




-- Comments
-- Toggle in normal mode
vim.keymap.set('n', '<Leader>c', '<Plug>(comment_toggle_linewise_current)')

-- Toggle in visual mode
vim.keymap.set('x', '<Leader>c', '<Plug>(comment_toggle_linewise_visual)')


-- Searching
vim.keymap.set("n", "<Leader>a", ":Find -i ", { noremap = false })
vim.keymap.set("n", "<Leader>k", [[:grep! "\b<C-R><C-W>\b"<CR>:cw<CR>]], opts)


-- Testing
vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", opts) -- Test This
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", opts)    -- Test File
vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", opts)   -- Test All
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", opts)    -- Test Last


-- Clipboard manipulation
vim.keymap.set("n", "<leader>yf", ':let @* = expand("%")<CR>', opts) -- Yank file name to clipboard








-- " fzf
-- nnoremap <Bslash> :Files<cr>
-- let g:fzf_layout = { 'down': '40%' }
--
-- " NERDTree
-- -- nnoremap <Leader>f :NERDTreeToggle<cr>
-- -- let g:NERDTreeWinSize=60
--
-- " Buffers
-- nnoremap <Leader>b :Buffers<cr>
-- nnoremap <Leader>db :call DeleteHiddenBuffers()<cr>
--
--
-- " Commenting
-- nnoremap <Leader>c :TComment<cr>
-- vnoremap <Leader>c :TComment<cr>
--
-- " Testing
-- let test#filename_modifier = ":p"
-- let test#strategy = "neovim"
-- nmap <silent> <leader>tt :TestNearest<CR> " Test This
-- nmap <silent> <leader>tf :TestFile<CR> " Test File
-- nmap <silent> <leader>ta :TestSuite<CR> " Test All
-- nmap <silent> <leader>tl :TestLast<CR> " Test Last
--
-- " Clipboard manipulation
-- " copy file path to clipboard, yank file name
-- nnoremap <Leader>yfn :let @* = expand("%")<cr>
-- "replace current word with contents of register
-- nnoremap <silent> cp "_cw<C-R>"<Esc>
-- nnoremap <Leader>sp :set paste<cr>
-- nnoremap <Leader>snp :set nopaste<cr>
-- nnoremap <Leader>snp :set nopaste<cr>
-- nnoremap Y y$
--
-- " Searching
-- nnoremap <Leader>a :Find<SPACE>
-- nnoremap <Leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR> " bind leader k to grep word under cursor
--
-- " Snippets
-- let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/vim/UltiSnips']
-- let g:UltiSnipsExpandTrigger="<S-Tab>"
-- nnoremap <Leader>ue :UltiSnipsEdit<cr>
-- let g:UltiSnipsEditSplit="vertical"
-- let g:UltiSnipsListSnippets="<c-s>"
-- let g:UltiSnipsJumpForwardTrigger="<c-l>"
-- let g:UltiSnipsJumpBackwardTrigger="<c-h>"
--
-- " Ale
-- nnoremap <Leader>d :ALEDetail<cr>
--
-- " Goyo
-- let g:goyo_height='100%'
-- function! s:goyo_enter()
--   set linebreak
--   set spell spelllang=en_us
--   set scrolloff=5
-- endfunction
--
-- function! s:goyo_leave()
--   set nolinebreak
--   set nospell
--   set scrolloff=10
-- endfunction
--
-- autocmd! User GoyoEnter nested call <SID>goyo_enter()
-- autocmd! User GoyoLeave nested call <SID>goyo_leave()
--
-- nnoremap <Leader>g :Goyo<cr>
