require("nvchad.options")

-- add yours here!

local o = vim.o

o.relativenumber = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 2

o.timeoutlen = 100 -- in mili seconds

vim.opt.termguicolors = true

-- transparent background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

-- o.cursorlineopt = "both" -- to enable cursorline!
--
--
