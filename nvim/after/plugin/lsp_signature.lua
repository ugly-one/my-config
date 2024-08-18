local cfg = {}  -- add your config here
local lsp_signature = require("lsp_signature")

lsp_signature.setup(cfg)

vim.keymap.set({ 'n' }, '<C-k>', function()
	lsp_signature.toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })
