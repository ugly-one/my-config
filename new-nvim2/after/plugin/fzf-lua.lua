local fzf = require('fzf-lua')
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Fzf Files" })
vim.keymap.set("n", "<leader>gf", fzf.live_grep, { desc = "Fzf Live Grep" })
