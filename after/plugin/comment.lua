local api = require("Comment.api")

vim.keymap.set("n", "<leader>/", api.toggle.linewise.current)
vim.keymap.set("v", "<leader>/",
               ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
