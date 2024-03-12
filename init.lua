vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 2

vim.g.OmniSharp_server_use_net6 = 1

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('OmniSharp/omnisharp-vim')
vim.call('plug#end')

vim.keymap.set('n', '<C-o><C-d>', '<cmd> OmniSharpGotoDefinition<CR>')
vim.keymap.set('n', '<C-o><C-i>', '<cmd> OmniSharpFindImplementations<CR>')
vim.keymap.set('n', '<C-o><C-u>', '<cmd> OmniSharpFindUsages<CR>')
vim.keymap.set('n', '<C-o><C-r>', '<cmd> OmniSharpRename<CR>')
