local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    -- [" asm "] = { "nasm" },
    -- python = { "flake8" }, -- this caused trouble with cph
    javascript = { "eslint_d" },
    -- java = { "jdtls" },
}

lint.linters.luacheck.args = {
    -- unpack(lint.linters.luacheck.args),
    "--globals",
    -- --   "love",
    -- "vim",
    -- "lvim",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})
