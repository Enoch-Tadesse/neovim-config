local M = {}

M.setup = function()
    require("noice").setup({
        lsp = {
            hover = { enabled = false }, -- Disable hover documentation
            documentation = { enabled = false }, -- Disable documentation popups
            override = {
                ["cmp.entry.get_documentation"] = false,
                ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                ["vim.lsp.util.stylize_markdown"] = false,
            },
        },
        popupmenu = { enabled = false }, -- Disable popupmenu for completions
        messages = { enabled = false }, -- Disable Noice messages UI
        redirect = {
            filter = { event = "msg_show" },
        },
        views = {}, -- Ensure no extra views are configured
        presets = {
            bottom_search = false, -- Don't use classic bottom cmdline for search
            command_palette = false, -- Don't position cmdline and popupmenu together
            long_message_to_split = false, -- Don't split long messages
            inc_rename = false, -- Disable input dialog for inc-rename.nvim
            lsp_doc_border = false, -- Remove border from LSP docs and signature help
        },
        cmdline = {
            enabled = false, -- Disable the cmdline UI (this might help if it interferes with normal completion)
        },
        notify = { enabled = false }, -- Disable Noice's notification system completely
    })
end

return M
