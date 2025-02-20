local M = {}

M.setup = function()
    require("noice").setup({
        lsp = {
            signature = { enabled = false },
            progress = { enabled = false },
            hover = { enabled = false },
        },
        views = {
            cmdline_popup = {
                position = {
                    row = 2,
                    col = "50%",
                },
            },
        },
    })
end

return M
