-- :HELP OPTIONS
vim.opt.background = "dark"
vim.opt.backspace = "indent,eol,start" -- Allows backspacing over everything in insert mode
vim.opt.backupcopy = "yes"
vim.opt.cursorline = true              -- highlight the current line
vim.opt.expandtab = true               -- convert tabs to spaces
vim.opt.fileencoding = "utf-8"         -- the encoding written to a file
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "syntax"
vim.opt.hlsearch = true    -- highlight all matches on previous search pattern
vim.opt.ignorecase = false -- ignore case in search patterns
vim.opt.iskeyword:append "-"
vim.opt.list = true
vim.opt.listchars = { trail = '·', tab = '>~' }
vim.opt.mouse = "a"             -- allow the mouse to be used in neovim
vim.opt.number = true           -- set numbered lines
vim.opt.ruler = true            -- show row,col of cursor in bottom corner
vim.opt.scrolloff = 10          -- make sure 10 lines are dispayed below bottom of file
vim.opt.shiftround = true       -- round indents to multiples of shiftwidth
vim.opt.shiftwidth = 2          -- the number of spaces inserted for each indentation
vim.opt.showtabline = 1         -- dont show tabs
vim.opt.spelllang = "en"        -- spell check in english
vim.opt.splitbelow = true       -- force all horizontal splits to go below current window
vim.opt.splitright = true       -- force all vertical splits to go to the right of current window
vim.opt.tabstop = 2             -- insert 2 spaces for a tab
vim.opt.termguicolors = true    -- set term gui colors (most terminals support this)
vim.opt.title = false           -- dont show a title bar at the top
vim.opt.undodir = "~/.vim/undo" -- Trace: do I need this?
vim.opt.wrap = true             -- wrap lines

-- trim trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})
-- vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
-- vim.opt.backup = false                          -- creates a backup file
-- vim.opt.clipboard = "unnamed"          -- allows neovim to access the system clipboard
-- vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
-- vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
-- vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
-- vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
-- vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
-- vim.opt.pumheight = 10                          -- pop up menu height
-- vim.opt.relativenumber = false                  -- set relative numbered lines
-- vim.opt.shortmess:append "c"
-- vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.sidescrolloff = 8
-- vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
-- vim.opt.smartcase = true                        -- smart case
-- vim.opt.smartindent = true                      -- make indenting smarter again
-- vim.opt.swapfile = false                        -- creates a swapfile
-- vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
-- vim.opt.undofile = true                         -- enable persistent undo
-- vim.opt.updatetime = 300                        -- faster completion (4000ms default)
-- vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited



-- Use ripgrep
if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg = "rg --vimgrep --hidden --no-column"
end
-- Define ripgrep :Find search command
vim.cmd [[command! -nargs=+ Find execute 'silent grep! <args>' | copen]]


-- Testing
vim.cmd [[let test#filename_modifier = ":p"]]
vim.cmd [[let test#strategy = "neovim"]]
vim.cmd [[let g:test#neovim#start_normal = 1]]
-- vim.cmd [[let g:test#javascript#jest#file_pattern = '\v(__tests__/.*|(spec|test))\.(js|jsx|coffee|ts|tsx)$']] -- Need this to support name.spec.ts
-- vim.cmd [[let g:test#javascript#jest#file_pattern = '\v.*spec\.ts$']] -- Need this to support name.spec.ts
