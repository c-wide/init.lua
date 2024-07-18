local silent = { silent = true }

vim.keymap.set("n", "<C-\\>", ":ToggleTerm<cr>")
vim.keymap
    .set("n", "<leader>th", ":ToggleTerm size=12 direction=horizontal<cr>")
vim.keymap.set("n", "<leader>tv", ":ToggleTerm size=50 direction=vertical<cr>")
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<cr>")

-- Terminal keybinds
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:ToggleTerm<cr>")
vim.keymap.set("t", "<S-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<S-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<S-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<S-l>", "<C-\\><C-n><C-w>l")

-- Window navigation
vim.keymap.set("n", "<S-h>", "<C-w>h", silent)
vim.keymap.set("n", "<S-j>", "<C-w>j", silent)
vim.keymap.set("n", "<S-k>", "<C-w>k", silent)
vim.keymap.set("n", "<S-l>", "<C-w>l", silent)

-- Window resizing
vim.keymap.set("n", "<S-Up>", ":resize +2<cr>", silent)
vim.keymap.set("n", "<S-Down>", ":resize -2<cr>", silent)
vim.keymap.set("n", "<S-Left>", ":vertical resize +2<cr>", silent)
vim.keymap.set("n", "<S-Right>", ":vertical resize -2<cr>", silent)
