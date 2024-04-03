vim.g.mapleader=" "
vim.g.maplocalleader=" "
vim.o.background="light"
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 2 -- to leave some margin at the bottom/top when scrolling so the current line is never at the very top or end.
vim.o.foldenable = false
vim.o.expandtab = true -- use spaces instead of tab
vim.o.tabstop = 4 -- adding only this setting doesn't make the tab to stop after 4 spaces. Had to add the 2 below.
vim.o.shiftwidth = 4 -- what does it do? added it because tabstop doesn't work
vim.o.softtabstop = 4 -- what does it do? added it because tabstop doesn't work

vim.g.OmniSharp_server_use_net6 = 1 -- I think this one has to be setup before something. Perhaps before we install the server. 
-- so maybe it's OK to have it after all plugins are installed

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('OmniSharp/omnisharp-vim') -- basic C# support
--Plug('tpope/vim-surround') -- to replace brackets/quotes with something else
Plug('prabirshrestha/asyncomplete.vim') -- not sure why I have this one. Why omnisharp-vim is not enough?
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' }) -- required by fzf-lua
Plug('ibhagwan/fzf-lua') -- finding files (and probably more!)
Plug('dense-analysis/ale') -- for showing errors
--Plug('tpope/vim-fugitive') -- testing if doing git stuff from nvim brings any benefits 
vim.call('plug#end')

vim.keymap.set('n', '<Leader>d', '<cmd> OmniSharpGotoDefinition<CR>')
vim.keymap.set('n', '<Leader>i', '<cmd> OmniSharpFindImplementations<CR>')
vim.keymap.set('n', '<Leader>u', '<cmd> OmniSharpFindUsages<CR>')
vim.keymap.set('n', '<Leader>r', '<cmd> OmniSharpRename<CR>')
vim.keymap.set('n', '<Leader><Space>', '<cmd> OmniSharpSignatureHelp<CR>')
vim.keymap.set('n', '<Leader>tl', '<cmd> OmniSharpTypeLookup<CR>') 
vim.keymap.set('n', '<Leader>ca', '<cmd> OmniSharpGetCodeActions<CR>')

vim.g.asyncomplete_auto_completeopt = 0
vim.o.completeopt="menuone,noinsert,noselect"
vim.g.asyncomplete_auto_popup = 1
vim.g.asyncomplete_force_refresh_on_context_changed = 1

vim.g.OmniSharp_highlight_types = 3 

--vim.keymap.set('i', '<CR>', function()
--    return vim.fn.pumvisible() == 1 and vim.fn['asyncomplete#close_popup']() or '<CR>'
--end, {expr = true})

vim.keymap.set('n', '<Leader>t', '<cmd>:FzfLua files<CR>')
vim.keymap.set('n', '<Leader>g', '<cmd>:FzfLua git_status<CR>')
--vim.wo.statusline='%t %{fugitive#statusline()} Water warrior'
vim.keymap.set('n', '<Leader>js', '<cmd>:%!jq .<CR>')
