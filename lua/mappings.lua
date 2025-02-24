require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

map("n", "J", ":m .+1<CR>==", { noremap = true, silent = true })
map("n", "K", ":m .-2<CR>==", { noremap = true, silent = true })

--TELESCOPE why ? keymaps are called here faster than any files except init
map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })

-- vim.key.set({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
