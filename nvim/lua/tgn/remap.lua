vim.g.mapleader = " "

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 8 -- to leave some margin at the bottom/top when scrolling so the current line is never at the very top or end.

vim.o.tabstop = 4 -- adding only this setting doesn't make the tab to stop after 4 spaces. Had to add the 2 below.
vim.o.shiftwidth = 4 -- what does it do? added it because tabstop doesn't work
vim.o.softtabstop = 4 -- what does it do? added it because tabstop doesn't work

-- open explorer
vim.keymap.set("n", "<C-e>", vim.cmd.Ex)
vim.keymap.set("n", "<Leader>js", "<cmd>:%!jq .<CR>")
-- keep the curson in the middle when going up and down a page
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- keep the cursor in the middle when going through search resutls - not sure why "zzzv", just copied it from somewhere else
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- when pasting over selected text, let's do not loose the pasted test from clipboard/register
vim.keymap.set("x", "<leader>p", "\"_dP")
-- copy into system's clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
-- delete into void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
-- open/close quick action buffer
vim.keymap.set('n', '<Leader>q', '<cmd>:copen<CR>')
vim.keymap.set('n', '<Leader>Q', '<cmd>:cclose<CR>')
-- use arrows to navigate between windows
vim.keymap.set('n', '<leader><left>', '<C-w>h')
vim.keymap.set('n', '<leader><right>', '<C-w>l')
vim.keymap.set('n', '<leader><up>', '<C-w>k')
vim.keymap.set('n', '<leader><down>', '<C-w>j')
-- save files only if something was modified
vim.keymap.set('n', '<leader>w', '<cmd>:up<cr>')
