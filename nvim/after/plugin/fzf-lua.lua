local fzf = require('fzf-lua')
vim.keymap.set("n", "<leader>ff", fzf.git_files, { desc = "Fzf Files" })
vim.keymap.set("n", "<leader>fs", fzf.live_grep, { desc = "Fzf Live Grep" })

fzf.setup({
    keymap = {
        fzf = {
            -- send all results to quick fix window
            ["ctrl-q"] = "select-all+accept",
        },
    },
})
