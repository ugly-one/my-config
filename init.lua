vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 2

vim.g.OmniSharp_server_use_net6 = 1

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('OmniSharp/omnisharp-vim')
Plug('tpope/vim-surround')
Plug('prabirshrestha/asyncomplete.vim')
vim.call('plug#end')

vim.keymap.set('n', '<C-o><C-d>', '<cmd> OmniSharpGotoDefinition<CR>')
vim.keymap.set('n', '<C-o><C-i>', '<cmd> OmniSharpFindImplementations<CR>')
vim.keymap.set('n', '<C-o><C-u>', '<cmd> OmniSharpFindUsages<CR>')
vim.keymap.set('n', '<C-o><C-r>', '<cmd> OmniSharpRename<CR>')
--vim.keymap.set('n', '<C-Space>', '<cmd> OmniSharpSignatureHelp<CR>')
--vim.keymap.set('i', '<C-Space>', '<cmd> OmniSharpSignatureHelp<CR>')
vim.keymap.set('n', '<C-o><C-t>', '<cmd> OmniSharpTypeLookup<CR>') 

vim.g.asyncomplete_auto_completeopt = 0
vim.o.completeopt="menuone,noinsert,noselect"
vim.g.asyncomplete_auto_popup = 1
vim.g.asyncomplete_force_refresh_on_context_changed = 1

vim.g.OmniSharp_highlight_types = 2


vim.keymap.set('i', '<CR>', function()
    return vim.fn.pumvisible() == 1 and vim.fn['asyncomplete#close_popup']() or '<CR>'
end, {expr = true})

