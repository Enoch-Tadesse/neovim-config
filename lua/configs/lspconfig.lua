local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- list of all servers configured.
lspconfig.servers = {
    "lua_ls",
    "pyright",
    "clangd",
    "ts_ls",
    "eslint",
}

-- list of servers configured with default config.
local default_servers = { "pyright", "clangd", "ts_ls", "eslint" }

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
})

-- lspconfig.eslint.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = true
--         on_attach(client, bufnr)
--     end,
--     settings = {
--         format = true, -- Automatically fix lint issues
--         codeActionOnSave = {
--             enable = true,
--             mode = "all",
--         },
--     },
--     on_init = on_init,
--     capabilities = capabilities,
-- })

lspconfig.ts_ls.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false -- Disable formatting (use Prettier)
        on_attach(client, bufnr)
    end,
    on_init = function(client)
        -- Additional initialization if needed
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
        tsserver = {
            preferences = {
                importModuleSpecifierPreference = "relative",
                quotePreference = "single",
            },
        },
    },
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
