vim.opt.timeoutlen=500
vim.g.mapleader=" "
vim.g.maplocalleader=" "
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 2 -- to leave some margin at the bottom/top when scrolling so the current line is never at the very top or end.
vim.o.foldenable = false
vim.o.expandtab = true -- use spaces instead of tab
vim.o.tabstop = 4 -- adding only this setting doesn't make the tab to stop after 4 spaces. Had to add the 2 below.
vim.o.shiftwidth = 4 -- what does it do? added it because tabstop doesn't work
vim.o.softtabstop = 4 -- what does it do? added it because tabstop doesn't work
vim.opt.clipboard = 'unnamedplus' -- copy to system's clipboard
vim.g.nvim_tree_respect_buf_cwd=1 -- open tree window at the location of current buffer
vim.g.netrw_keepdir=0 -- something that doesn't allow me to copy files ?!
vim.g.OmniSharp_server_use_net6 = 1 -- I think this one has to be setup before something. Perhaps before we install the server. 
-- so maybe it's OK to have it after all plugins are installed

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('OmniSharp/omnisharp-vim') -- basic C# support
Plug('prabirshrestha/asyncomplete.vim') -- not sure why I have this one. Why omnisharp-vim is not enough?
-- having issues with fzf - not able to find files - I get an infinite spinner
--Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' }) -- required by fzf-lua
--Plug('ibhagwan/fzf-lua') -- finding files (and probably more!)
-- using telescope for now
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('dense-analysis/ale') -- for showing errors
Plug('tpope/vim-fugitive') -- testing if doing git stuff from nvim brings any benefits. So far it's useful to do Git blame
Plug('catppuccin/nvim',{ ['as'] = 'catppucin' }) -- theme
vim.call('plug#end')

vim.cmd.colorscheme "catppuccin"

vim.keymap.set('n', '<Leader>d',        '<cmd> OmniSharpGotoDefinition<CR>')
vim.keymap.set('n', '<Leader>i',        '<cmd> OmniSharpFindImplementations<CR>')
vim.keymap.set('n', '<Leader>u',        '<cmd> OmniSharpFindUsages<CR>')
vim.keymap.set('n', '<Leader>r',        '<cmd> OmniSharpRename<CR>')
vim.keymap.set('n', '<Leader><Space>',  '<cmd> OmniSharpSignatureHelp<CR>')
vim.keymap.set('i', '<C-b>',            '<C-o> <cmd>OmniSharpSignatureHelp<CR>')
vim.keymap.set('n', '<Leader>tl',       '<cmd> OmniSharpTypeLookup<CR>') 
vim.keymap.set('n', '<Leader>ca',       '<cmd> OmniSharpGetCodeActions<CR>')
vim.keymap.set('n', '<Leader>se',       '<cmd> OmniSharpGlobalCodeCheck<CR>')
vim.keymap.set('n', '<Leader>cf',       '<cmd> OmniSharpCodeFormat<CR>')
vim.keymap.set('n', '<Leader>rt',       '<cmd> !dotnet test<CR>')
vim.keymap.set('n', '<Leader>b',        '<cmd> :wa <BAR> !dotnet build<CR>') -- time to learn how to write lua functions?
vim.keymap.set('n', '<Leader>rct',      '<cmd> :wa <BAR> OmniSharpRunTest<CR>')
vim.keymap.set('n', '<Leader>do',       '<cmd> OmniSharpDocumentation<CR>')

vim.keymap.set('n', '<Leader>op', function() 
    print("test", false)
    print("hahahaha")
    --vim.fn.setqflist([], 'r', {'title': 'My search'})
end)

vim.g.asyncomplete_auto_completeopt = 0
vim.o.completeopt="menuone,noinsert,noselect"
vim.g.asyncomplete_auto_popup = 1
vim.g.asyncomplete_force_refresh_on_context_changed = 1

vim.g.OmniSharp_highlight_types = 3 
-- by default omnisharp comes with 'info' log level, which slows down start-up of nvim a lot. There is some "info" ("Analyzer work cancelled") that is written to a log file A LOT. 
-- by setting the log level to 'error' I can speed-up the start-up quite a bit (nvim doesn't spend time writing info to log). It still doesn't explain why I see so many of those "Analyzer work cancelled" ;)
vim.g.OmniSharp_loglevel = 'error'

--vim.keymap.set('i', '<CR>', function()
--    return vim.fn.pumvisible() == 1 and vim.fn['asyncomplete#close_popup']() or '<CR>'
--end, {expr = true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>js', '<cmd>:%!jq .<CR>')

-- opening and closing quickfix list
vim.keymap.set('n', '<Leader>q', '<cmd>:copen<CR>')
vim.keymap.set('n', '<Leader>Q', '<cmd>:cclose<CR>')
vim.keymap.set('n', '<C-j>','<cmd> :cn<CR>') -- go to next error
vim.keymap.set('n', '<C-k>','<cmd> :cp<CR>') -- go to previous error
