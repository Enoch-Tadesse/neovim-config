local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- list of all servers configured.
lspconfig.servers = {
    -- "jdtls",
    "gopls",
    "pyright",
    "lua_ls",
    "clangd",
    "ts_ls",
}

-- list of servers configured with default config.
local default_servers = { "clangd" }

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

lspconfig.ts_ls.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    -- capabilities = capabilities,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

lspconfig.pyright.setup({
    capabilities = capabilities,
    filetypes = { "python" },
    on_attach = function(client, bufnr)
        -- Disable signature help
        client.server_capabilities.signatureHelpProvider = false
    end,
    settings = {
        python = {
            pythonPath = "/home/henok/Desktop/messi/tele/bin/python",
        },
    },
})

require("lspconfig").gopls.setup({
    cmd = { "gopls", "-vv", "serve" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Ensure capabilities are passed
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            -- Key addition for import completion:
            completeUnimported = true, -- Show completions for unimported packages
            usePlaceholders = true, -- Add placeholders for function arguments
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
            },
        },
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        -- Optional: Map "gd" to Go-to-definition, etc.
    end,
})

lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false -- true for autoformatting
        client.server_capabilities.signatureHelpProvider = false
        client.server_capabilities.documentRangeFormattingProvider = true
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})


lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                -- enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
